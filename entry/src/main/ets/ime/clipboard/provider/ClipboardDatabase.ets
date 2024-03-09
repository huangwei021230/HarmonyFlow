import pasteboard from '@ohos.pasteboard';
import fileUri from '@ohos.file.fileuri';
import uri from '@ohos.uri';
import ClipboardMediaProvider from './ClipboardMediaProvider';
import systemDateTime from '@ohos.systemDateTime';
import data from '@ohos.telephony.data';
import relationalStore from '@ohos.data.relationalStore';
import { store } from '../../../ServiceExtAbility/ServiceExtAbility';
import dataShare from '@ohos.data.dataShare';

enum ItemType{
  TEXT = 1,
  IMAGE = 2,
  VIDEO = 3,
}


namespace ItemType {
  export function fromInt(value: number): ItemType {
    if(value == 1){
      return ItemType.TEXT;
    }else if(value == 2){
      return ItemType.IMAGE;
    }else if(value == 3){
      return ItemType.VIDEO;
    }
    throw new Error('Invalid ItemType value');
  }
}

/**
 * Represents an item on the clipboard.
 *
 * If type == ItemType.IMAGE there must be a uri set
 * if type == ItemType.TEXT there must be a text set
 */
const FLOW_CLIP_LABEL = "harmony/clipboard_item";

class ClipboardItem{
  id: number = 0
  public type: ItemType
  public text: string | null
  public uri: string | null  // 在 TypeScript 中可以直接使用 string 类型来表示 URI
  public creationTimestampMs: number
  public isPinned: boolean
  public mimeTypes: string[]

  constructor(type:ItemType, text:string, uri: string, timeStampMs:number, isPinned:boolean,mineTypes:string[]);
  constructor(type:ItemType, text:string, uri: string, timeStampMs:number, isPinned:boolean,mineTypes:string[], id:number);
  constructor(type:ItemType, text:string, uri: string, timeStampMs:number, isPinned:boolean,mineTypes:string[], id?:number){
    this.type = type;
    this.text = text;
    this.uri = uri;
    this.creationTimestampMs = timeStampMs;
    this.isPinned = isPinned;
    this.mimeTypes = mineTypes;
    if(id !== undefined){
      this.id = id;
    }
  }
  static TEXT_PLAIN: string[] = ["text/plain"]
  static MEDIA_PROTECTION: string[] = ["_display_name"]
  static FLOW_CLIP_LABEL = "flow/clipboard_item"

  /**
   *  初始化，arkts没有类似@Entity类的注解自动初始化数据库
   *  需要实现关于mimeTypes的encoder和decoder
   */
  static rowID: number = 1;



  static init(){
    const sql = "CREATE TABLE CLIPBOARD_HISTORY_TABLE ( _id INTEGER PRIMARY KEY AUTOINCREMENT, type INTEGER, text TEXT, uri TEXT, creationTimestampMs INTEGER, isPinned INTEGER, mimeTypes TEXT );"
    store.executeSql(sql)
  }



  static text(text: string): ClipboardItem{
    return new ClipboardItem(ItemType.TEXT, text, null, systemDateTime.getTime(true), false, ClipboardItem.TEXT_PLAIN, ClipboardItem.rowID++)
  }


  static fromClipData(context: Context, data: pasteboard.PasteData, cloneUri:boolean): ClipboardItem{
    let dataRecord:pasteboard.PasteDataRecord = data.getRecord(0);
    let type: ItemType
    if(dataRecord?.uri !== null && data.hasType("image/*")){
      type = ItemType.IMAGE;
    }else if(dataRecord?.uri !== null && data.hasType("video/*")){
      type = ItemType.VIDEO;
    }else{
      type = ItemType.TEXT;
    }
    let dataUri = new uri.URI(dataRecord.uri)
    let uriStr: string | null = null;

    if(type === ItemType.IMAGE || type === ItemType.VIDEO) {
      /**
       * dataRecord.uri返回的是简单的string类型，和fileUri不同，
       * 无法通过authority进行进一步验证
       */
      if (dataUri.authority == ClipboardMediaProvider.AUTHORITY || !cloneUri) {
        uriStr = dataRecord.uri
      } else {
        let displayName = ""
        switch (type) {
          case ItemType.IMAGE:
            displayName = "Image"
            break;
          case ItemType.VIDEO:
            displayName = "Video"
            break;
          default:
            displayName = "Unknown"
            break;
        }

        // tryOrNull


      }
    } else {
      uriStr = null;
    }



    let text: string = dataRecord.plainText?.toString();
    let mimeTypes: string[]
    if(type == ItemType.TEXT){
      mimeTypes[0] = ClipboardItem.TEXT_PLAIN[0]
    }

    // 注意这边使用的是uriStr，和florisboard中的Uri类仍然存在区别
    return new ClipboardItem(type, text, uriStr, systemDateTime.getTime(true), false, mimeTypes)

  }

  toClipData(context: Context): pasteboard.PasteData{
    if(this.type == ItemType.TEXT){
      return pasteboard.createData(ClipboardItem.TEXT_PLAIN[0], this.text)
    }else if(this.type == ItemType.IMAGE){
      return pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, this.uri)
    }
  }

}

