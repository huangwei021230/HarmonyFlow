import dataShare from '@ohos.data.dataShare';
import DataShareExtensionAbility from '@ohos.application.DataShareExtensionAbility';
import relationalStore from '@ohos.data.relationalStore';
import Want from '@ohos.app.ability.Want';
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import uri from '@ohos.uri';
import { UriMatcher } from '../../../lib/io/UriMatcher';
import { store } from '../../../ServiceExtAbility/ServiceExtAbility';

let DB_NAME = 'DB00.db';
const CLIPBOARD_FILES_TABLE = 'clipboard_files';




interface Columns {
  mediaUri: string;
  mimeTypes: string;
}

const columns: Columns = {
  mediaUri: "media_uri",
  mimeTypes: "mime_types"
};


export class ClipboardMediaProvider extends DataShareExtensionAbility{

  /**
   * Companion Object
   */
  static AUTHORITY : string = "com.boogiepop.myapplication.provider.clipboard"
  static IMAGE_CLIPS_URI : uri.URI = new uri.URI("content://$AUTHORITY/clips/images")
  static VIDEO_CLIPS_URI : uri.URI = new uri.URI("content://$AUTHORITY/clips/videos")

  static IMAGE_CLIP_ITEM : number = 0
  static IMAGE_CLIPS_TABLE : number = 1
  static VIDEO_CLIP_ITEM : number = 2
  static VIDEO_CLIPS_TABLE : number = 3

  static Matcher: UriMatcher = new UriMatcher(UriMatcher.NO_MATCH)



  onCreate(want: Want, callback: Function) {
    ClipboardMediaProvider.Matcher.addURI(ClipboardMediaProvider.AUTHORITY, "clips/images/#", ClipboardMediaProvider.IMAGE_CLIP_ITEM)
    ClipboardMediaProvider.Matcher.addURI(ClipboardMediaProvider.AUTHORITY, "clips/images", ClipboardMediaProvider.IMAGE_CLIPS_TABLE)
    ClipboardMediaProvider.Matcher.addURI(ClipboardMediaProvider.AUTHORITY, "clips/videos/#", ClipboardMediaProvider.VIDEO_CLIP_ITEM)
    ClipboardMediaProvider.Matcher.addURI(ClipboardMediaProvider.AUTHORITY, "clips/videos", ClipboardMediaProvider.VIDEO_CLIPS_TABLE)


  }



  /**
   * @param uri               string                                  fileUri
   * @param predicates        dataSharePredicates.DataSharePredicates 筛选条件
   * @param columns           Array<string>                           要查询的列,如果值为空，则查询应用于所有列
   * @param callback          Function                                指定callback回调函数。如果操作成功，则返回ResultSet对象
   */
  query(uri: string, predicates: dataSharePredicates.DataSharePredicates, columns: Array<string>, callback: Function) {
    if (predicates === null || predicates === undefined) {
      return;
    }
    store?.query(CLIPBOARD_FILES_TABLE, predicates, columns, (err, resultSet) => {
      if (resultSet !== undefined) {
        console.info(`resultSet.rowCount: ${resultSet.rowCount}`);
      }
      if (callback !== undefined) {
        callback(err, resultSet);
      }
    });
  }

  /**
   * @param uri           string
   * @param valueBucket   ValuesBucket  键值对，表示插入数据
   * @param callback      Function
   */
  insert(uri: string, valueBucket: ValuesBucket, callback: Function) {
    if (valueBucket === null) {
      console.error('invalid valueBuckets');
      return;
    }
    store?.insert(CLIPBOARD_FILES_TABLE, valueBucket, (err, ret) => {
      console.info(`callback ret: ${ret}`);
      if (callback !== undefined) {
        callback(err, ret);
      }
    });
  }
};

export default ClipboardMediaProvider;