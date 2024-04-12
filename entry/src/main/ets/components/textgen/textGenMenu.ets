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
import { InputHandler } from '../../model/KeyboardController';
import {  MenuType } from '../../model/KeyboardKeyData';
import { store } from '../../ServiceExtAbility/ServiceExtAbility';
import relationalStore from '@ohos.data.relationalStore';
import { ClipboardManager } from '../clipboard/ClipboardManager';
import optNative from 'liboptnative.so'
@Preview
@Component
export struct TextGenMenu {
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;

  build() {
    Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
      Stack(){
        Image($rawfile('ic_back.svg'))
          .width('32vp')
          .height('32vp')
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(async () => {
        let returnText = optNative.getReturnString("hello world")
        console.log("114514: ", returnText)
      })
    }
    .width('100%')
    .height(this.inputStyle.downMenuHeight)
    .padding(1)
    .backgroundColor('#ffffff')
    .borderColor('#33000000')
    .borderWidth(0.5)
  }
}