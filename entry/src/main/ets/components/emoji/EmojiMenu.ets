import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration';
import { keySourceListData, keySourceListType, KeyState } from '../../model/KeyboardKeyData';
import { EmojiItem } from './EmojiItem';

@Styles function pressedStyles() {
  .backgroundColor($r('app.color.key_item_gray_pressed'))
}

@Styles function normalStyles() {
  .backgroundColor($r('app.color.key_item_gray'))
}


@Component
export struct EmojiMenu{
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;
  @Provide keyState: number = KeyState.LOWER_CASE;
  private keyList: keySourceListType[] = keySourceListData;
  private spaceWidth: Resource = this.inputStyle.spaceButtonWidth_1;
  private returnWidth: Resource = this.inputStyle.returnButtonWidthType_1;

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        ForEach(this.keyList.slice(0, 10), (item: keySourceListType) => {
          EmojiItem({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })
    }
  }
}