import fileUri from '@ohos.file.fileuri'
import fs from '@ohos.file.fs';
import systemDateTime from '@ohos.systemDateTime';
import File from '@system.file';
import uri from '@ohos.uri';
/**
 * Backend helper object which is used by [ClipboardMediaProvider] to serve content.
 */

class ClipboardFileStorage{
  clipboardFilesDir: fs.File
  constructor(context: Context) {
    fs.mkdirSync(context.filesDir.toString() + "/clipboard_files");
    this.clipboardFilesDir = fs.openSync(context.filesDir.toString() + "/clipboard_files")

  };

  cloneUri(context: Context, uri: uri.URI) : number{
    const id = systemDateTime.getTime(true);
    let filePath = context.filesDir.toString() + "/clipboard_files" + "/" + id.toString();
    // OpenMode.CREATE 0o100 若文件不存在，则创建文件。
    // fs.openSync 返回打开的文件的fd（文件描述符）

    let stream = fs.createStreamSync(filePath, "r+");
    let fromFile = fs.openSync(uri.toString())
    try{
      // 读取输入流并复制到输出流
      let buf = new ArrayBuffer(4096);
      let len = fs.readSync(fromFile.fd, buf);
      while (len !== -1) {

        let num = stream.writeSync(buf);
        len = fs.readSync(fromFile.fd, buf);
      }
    }catch (e){
      console.log("ClipboardFileStorage: " + e)
    }
    stream.close()
    fs.close(fromFile);
    return id;
  }
  /**
   * Deletes the file corresponding to an id.
   */
  deleteById(context: Context, id: number){
    let filePath = context.filesDir.toString() + "/clipboard_files" + "/" + id.toString();
    let bool = fs.access(filePath);
    if(bool){
      fs.unlink(filePath);
    }
  }


  getFileForId(context: Context, id: number): File{
    let filePath = context.filesDir.toString() + "/clipboard_files" + "/" + id.toString();
    let bool = fs.access(filePath);
    if(bool){
      return fs.openSync(filePath);
    }else{
      return null;
    }
  }
}