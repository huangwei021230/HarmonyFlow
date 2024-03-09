import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration';
import {
  clipBoardItemList,
  combinedList,
  emotionList,
  emotion_emojis,
  keySourceListData, keySourceListType, KeyState,
  sourceListType } from '../../model/KeyboardKeyData';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import Log from '../../model/Log';
import hilog from '@ohos.hilog';
import { ClipboardItem } from './ClipboardItem';

@Styles function pressedStyles() {
  .backgroundColor($r('app.color.key_item_gray_pressed'))
}

@Styles function normalStyles() {
  .backgroundColor($r('app.color.key_item_gray'))
}


@Component
export struct ClipboardMenu{
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;
  private clipBoardItemList = clipBoardItemList
  private spaceWidth: Resource = this.inputStyle.spaceButtonWidth_1;
  private returnWidth: Resource = this.inputStyle.returnButtonWidthType_1;


  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        ForEach(this.clipBoardItemList.slice(0,2), (item: sourceListType) => {
          ClipboardItem({ keyValue: { content: item.content, title: item.content, upperContent: item.content } })
        }, (item: sourceListType) => item.content)
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })
    }
  }

}