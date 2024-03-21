import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration';
import {
  clipBoardList,
  combinedList,
  emotionList,
  emotion_emojis,
  keySourceListData, keySourceListType, KeyState,
  sourceListType } from '../../model/KeyboardKeyData';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import Log from '../../model/Log';
import hilog from '@ohos.hilog';
import { ClipItem } from './ClipItem';
import { ClipboardManager } from './ClipboardManager';
import display from '@ohos.display';

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
  @StorageLink('ClipboardItemList') private clipBoardItemList: sourceListType[] = ClipboardManager.ClipboardItemList
  private spaceWidth: Resource = this.inputStyle.spaceButtonWidth_1;
  private returnWidth: Resource = this.inputStyle.returnButtonWidthType_1;
  private screenWidth: number = px2vp(display.getDefaultDisplaySync().width);
  scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Stack() {
        Flex({ direction: FlexDirection.Column, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Center }) {
          Flex({ justifyContent: FlexAlign.Start, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Center }) {
            ForEach(this.clipBoardItemList, (item: sourceListType) => {
              ClipItem({
                keyValue: { content: item.content, title: item.content, upperContent: item.content },
                WIDTH: item.content.length * 10 > this.screenWidth ? this.screenWidth : item.content.length * 10,
                HEIGHT: item.content.length * 10 >= this.screenWidth ? item.content.length * 10 / this.screenWidth : 1
              })
            }, (item: sourceListType) => item.content)
          }
          .width('100%')
          .height(this.inputStyle.basicButtonHeight)
          .margin({ top: this.inputStyle.paddingTop, left: this.inputStyle.paddingLeftRight})
        }
      }
    }
    .scrollable(ScrollDirection.Vertical)
    .width("100%")
    .height("100%")
  }

}