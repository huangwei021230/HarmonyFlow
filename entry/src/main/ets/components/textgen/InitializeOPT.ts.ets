import optNative from 'liboptnative.so'
import fs from '@ohos.file.fs';
import { Log } from '../../utils/Log'

class InitializeOPT {
  private TAG = "InitializeOPT"

  async initialize(context: Context)  {
    let filesDir = context.filesDir
    Log.info("114514", filesDir)
    optNative.initialize(context.filesDir)
    Log.info(this.TAG, 'filesDir: ' + filesDir);

    // let files = ['vocab.txt', 'Clip_opt.ptl']
    // let files = ['vocab.txt']
    // for (let i = 0; i < files.length; i++ ) {
    //   let path = filesDir + "/" + files[i]
    //   let sss = fs.createStreamSync(path, "w");//没有会创建一个空的input.txt
    //   sss.closeSync();
    //
    //   let fd = await context.resourceManager.getRawFd('rawfile/' + files[i])
    //   fs.copyFileSync(fd.fd, path);
    // }
  }
}

export default new InitializeOPT()
