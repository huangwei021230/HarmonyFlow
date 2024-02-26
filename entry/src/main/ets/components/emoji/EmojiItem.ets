import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration'
import { InputHandler } from '../../model/KeyboardController'
import { keySourceListType } from '../../model/KeyboardKeyData'

@Styles function pressedStyles() {
  .backgroundColor($r('app.color.key_item_normal_pressed'))
}

@Styles function normalStyles() {
  .backgroundColor($r('app.color.key_item_normal'))
}

// 表情符号按键
@Component
export struct EmojiItem{
  private keyValue: keySourceListType | undefined = undefined
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      if (this.keyValue) {
        Text(this.keyValue.content)
          .fontSize(this.inputStyle.symbol_fontSize)
      }
    }
    .backgroundColor($r('app.color.key_item_normal'))
    .borderRadius(4)
    .width(this.inputStyle.basicButtonWidth)
    .height('100%')
    .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: 3 })
    .onClick(() => {
      if (this.keyValue) {
        InputHandler.getInstance().insertText(this.keyValue.content);
      }
    })
    .stateStyles({
      normal: normalStyles, pressed: pressedStyles
    })
  }
}