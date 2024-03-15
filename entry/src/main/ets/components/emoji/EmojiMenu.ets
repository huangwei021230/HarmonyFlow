import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration';
import { combinedList,
  emotionList,
  emotion_emojis,
  keySourceListData, keySourceListType, KeyState,
  sourceListType } from '../../model/KeyboardKeyData';
import { KeyItem } from '../basicUI/KeyItem';
import { EmojiItem } from './EmojiItem';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import Log from '../../model/Log';
import hilog from '@ohos.hilog';

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
  private emojiList: sourceListType[] = emotionList;
  private spaceWidth: Resource = this.inputStyle.spaceButtonWidth_1;
  private returnWidth: Resource = this.inputStyle.returnButtonWidthType_1;


  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        ForEach(this.emojiList.slice(0,10), (item: sourceListType) => {
          EmojiItem({ keyValue: { content: item.content, title: item.content, upperContent: item.content } })
        }, (item: sourceListType) => item.content)

      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })
    }
  }

}