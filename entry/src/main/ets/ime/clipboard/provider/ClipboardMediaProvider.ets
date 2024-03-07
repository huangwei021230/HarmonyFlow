import dataShare from '@ohos.data.dataShare';
import DataShareExtensionAbility from '@ohos.application.DataShareExtensionAbility';
import relationalStore from '@ohos.data.relationalStore';
import Want from '@ohos.app.ability.Want';
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

let DB_NAME = 'DB00.db';
const CLIPBOARD_FILES_TABLE = 'clipboard_files';

let DDL_TBL_CREATE = 'CREATE TABLE IF NOT EXISTS '
  + CLIPBOARD_FILES_TABLE
  + ' (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, phoneNumber DOUBLE, isStudent BOOLEAN, Binary BINARY)';


let rdbStore: relationalStore.RdbStore;

interface Columns {
  mediaUri: string;
  mimeTypes: string;
}

const columns: Columns = {
  mediaUri: "media_uri",
  mimeTypes: "mime_types"
};


class ClipboardMediaProvider extends DataShareExtensionAbility{

  onCreate(want: Want, callback: Function) {
    relationalStore.getRdbStore(this.context, {
      name: DB_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    }, (err, data) => {
      console.info(`getRdbStore done, data : ${data}`);
      rdbStore = data;
      rdbStore.executeSql(DDL_TBL_CREATE, [], (err) => {
        console.error(`executeSql done, error message : ${err}`);
      });
      if (callback) {
        callback();
      }
    });
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
    rdbStore.query(CLIPBOARD_FILES_TABLE, predicates, columns, (err, resultSet) => {
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
    rdbStore.insert(CLIPBOARD_FILES_TABLE, valueBucket, (err, ret) => {
      console.info(`callback ret: ${ret}`);
      if (callback !== undefined) {
        callback(err, ret);
      }
    });
  }



};

export default ClipboardMediaProvider;