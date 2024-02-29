import resourceManager from '@ohos.resourceManager'
import InputMethodExtensionContext from '@ohos.InputMethodExtensionContext'
import App from '@system.app'
import { BusinessError } from '@ohos.base'
import util from '@ohos.util'


export class EmojiKeyboardController{
  context: Context
  // container: EmojiContainer
  emojisArray: string[] = [" "]

  constructor(context: InputMethodExtensionContext) {
    this.context = context
    this.init()
  }
  init() {



  }
}

// class EmojiContainer{
//   emojiText: string = " "
//
//   constructor(context: InputMethodExtensionContext) {
//     try {
//       const emojiContent = context.resourceManager.getRawFileContentSync("ime/media/emoji/root.txt")
//       const decoder = new util.TextDecoder()
//       this.emojiText = decoder.decode(emojiContent)
//
//     } catch (error) {
//       let code = (error as BusinessError).code;
//       let message = (error as BusinessError).message;
//       console.error(`promise getRawFileContent failed, error code: ${code}, message: ${message}.`);
//     }
//   }
// }