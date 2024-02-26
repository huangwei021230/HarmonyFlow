import resourceManager from '@ohos.resourceManager'
import InputMethodExtensionContext from '@ohos.InputMethodExtensionContext'
import App from '@system.app'
import { BusinessError } from '@ohos.base'
import util from '@ohos.util'


export class EmojiKeyboardController{
  context: Context
  container: EmojiContainer
  emojisArray: string[] = [" "]
  constructor(context: InputMethodExtensionContext) {
    this.context = context
    this.container = new EmojiContainer(context)
    this.init()
  }
  init() {
    console.log("1014514" + this.container.emojiText)
    this.emojisArray = (this.container.emojiText).split(new RegExp('\r?\n')).filter(Boolean);

    this.emojisArray.forEach(emoji =>{
      console.log("114514" + emoji);
    })

  }
}

class EmojiContainer{
  emojiText: string = " "

  constructor(context: InputMethodExtensionContext) {
    try {
      const emojiContent = context.resourceManager.getRawFileContentSync("ime/media/emoji/temp.txt")
      const decoder = new util.TextDecoder()
      this.emojiText = decoder.decode(emojiContent)
      console.log("114514:" + this.emojiText.length)

    } catch (error) {
      let code = (error as BusinessError).code;
      let message = (error as BusinessError).message;
      console.error(`promise getRawFileContent failed, error code: ${code}, message: ${message}.`);
    }
  }
}