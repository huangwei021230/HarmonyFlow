import pasteboard from '@ohos.pasteboard';
import fileUri from '@ohos.file.fileuri';

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
  constructor(id:number, type:ItemType, text:string, uri: string, timeStampMs:number, isPinned:boolean,mineTypes:string[]) {
    this.id = id;
    this.type = type;
    this.text = text;
    this.uri = uri;
    this.creationTimestampMs = timeStampMs;
    this.isPinned = isPinned;
    this.mimeTypes = mineTypes;
  }

}
function createTextClipboardItem(text: string): ClipboardItem{
  let ret = new ClipboardItem(0, ItemType.TEXT, text, null, Date.now(), false, ['text/plain']);
  return ret;
}

function fromClipData(context: Context, data: pasteboard.PasteData, cloneUri:boolean):ClipboardItem{
  let dataRecord:pasteboard.PasteDataRecord = data.getRecord(0);
  let type: ItemType
  if(dataRecord?.uri !== null && data.hasType("image/*")){
    type = ItemType.IMAGE;
  }else if(dataRecord?.uri !== null && data.hasType("video/*")){
    type = ItemType.VIDEO;
  }else{
    type = ItemType.TEXT;
  }

  let uri: string | null = null;
  if(type === ItemType.IMAGE || type === ItemType.VIDEO){
    /**
     * dataRecord.uri返回的是简单的string类型，和fileUri不同，
     * 无法通过authority进行进一步验证
     */
    uri = dataRecord.uri
  }else{

  }
  let pasteBoardDataType:string = data.getPrimaryMimeType()
  return undefined
}