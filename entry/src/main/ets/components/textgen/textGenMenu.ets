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
import { InputHandler, inputString, inputToken } from '../../model/KeyboardController';
import {  MenuType } from '../../model/KeyboardKeyData';
import { store } from '../../ServiceExtAbility/ServiceExtAbility';
import relationalStore from '@ohos.data.relationalStore';
import { ClipboardManager } from '../clipboard/ClipboardManager';
import optNative from 'liboptnative.so'
import { textGenItem } from './textGenItem';

@Preview
@Component
export struct TextGenMenu {
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;
  @Provide("items") items: string[] = [];
  savedInput: String = "";
  build() {
    Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
      if(this.items.length){
        Row(){
          ForEach(this.items, (item: string) => {
            textGenItem({
              keyValue: {content: item, upperContent: item, title: item, width: 10},
              WIDTH: item.length * 10 + 20,
            })
          })
        }
        .width("100%")
      }
      Stack(){
        Image($rawfile('ic_ai.svg'))
          .width('32vp')
          .height('32vp')
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(async () => {
        let returnText = '';
        if(inputString.charAt(inputString.length - 1) == ' '){
          returnText = optNative.getReturnString(inputString.substring(0, inputString.length - 1))
        }else{
          returnText = optNative.getReturnString(inputString)
        }
        let tokens = returnText.split(' ')
        tokens = tokens.filter(token => token != '');
        tokens = tokens.filter(token => token != ' ');
        this.items = tokens
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

