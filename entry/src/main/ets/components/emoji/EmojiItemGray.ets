/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF InputStyle KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { KeyStyle, StyleConfiguration } from '../../common/StyleConfiguration';
import { MenuKey, MenuType } from '../../model/KeyboardKeyData';


@Styles function pressedStyles() {
  .backgroundColor($r('app.color.key_item_gray_pressed'))
}

@Styles function normalStyles() {
  .backgroundColor($r('app.color.key_item_gray'))
}

// 无大小写的灰色组件
@Component
export struct EmojiItemGray {
  private keyValue: string | undefined = undefined;
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;
  lastMenuType: number;
  build() {
    Stack() {
      if (this.keyValue) {
        Text(this.keyValue).fontSize(this.inputStyle.switchNumberFontSize).fontColor('black')
      }
    }
    .backgroundColor($r('app.color.key_item_gray'))
    .borderRadius(4)
    .onClick(() => {
      if(this.menuType == MenuType.EMOJI){
        this.menuType = this.lastMenuType;
      }else{
        this.lastMenuType = this.menuType;
        this.menuType = MenuType.EMOJI;
      }
    })
    .height('100%')
    .width(this.inputStyle.switchButtonWidth)
    .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: 3 })
    .stateStyles({
      normal: normalStyles, pressed: pressedStyles
    })
  }
}