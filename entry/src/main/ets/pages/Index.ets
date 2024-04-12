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
import deviceInfo from '@ohos.deviceInfo';
import Log from '../model/Log';
import { InputHandler } from '../model/KeyboardController';
import {
  MenuType,
  keySourceListData,
  numberSourceListData,
  symbolSourceListData,
  keySourceListType,
  sourceListType,
  combinedList,
  emotionList,
} from '../model/KeyboardKeyData';
import { KeyMenu } from '../components/basicUI/KeyMenu';
import { NumberMenu } from '../components/basicUI/NumberMenu';
import { StyleConfiguration, KeyStyle } from '../common/StyleConfiguration';
import { SymbolMenu } from '../components/basicUI/SymbolMenu';
import { TopMenu } from '../components/basicUI/TopMenu';
import { EmojiMenu } from '../components/emoji/EmojiMenu';
import { ClipboardMenu } from '../components/clipboard/ClipboardMenu';
import { store } from '../ServiceExtAbility/ServiceExtAbility';
import relationalStore from '@ohos.data.relationalStore'  ;
import { ClipboardManager } from '../components/clipboard/ClipboardManager';
import { TextGenMenu } from '../components/textgen/textGenMenu';
import { initialize } from 'liboptnative.so';
import InitializeOPT from '../components/textgen/InitializeOPT.ts';
const DEVICE_TYPE: string = deviceInfo.deviceType;
const TAG: string = 'index->';

@Entry
@Component
export struct Index {
  @StorageLink("keyList") keyList: keySourceListType[] = keySourceListData;
  @State private numberList: sourceListType[] = numberSourceListData;
  @State private symbolList: sourceListType[] = symbolSourceListData;
  // 表情包列表
  @State private emojiList: sourceListType[] = emotionList;
  @State private clipBoardList: sourceListType[] = ClipboardManager.ClipboardItemList

  @Provide menuType: number = MenuType.NORMAL;
  @StorageLink('inputPattern') @Watch('inputPatternChange') inputPattern: InputType = InputType.Normal
  @StorageLink('isLandscape') @Watch('change') isLandscape: boolean = false;
  @StorageLink('isRkDevice') isRkDevice: boolean = true;
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, DEVICE_TYPE);


  onBackPress(): boolean {
    Log.showInfo(TAG, 'kikaInput onBackPress');
    InputHandler.getInstance().hideKeyboardSelf();
    return true;
  }


  aboutToAppear(){
    console.log("114514:", getContext(this))
    InitializeOPT.initialize(getContext(this))
  }


  inputPatternChange(): void {
    if (this.inputPattern === InputType.Number || this.inputPattern === InputType.PhoneNumber) {
      this.menuType = MenuType.NUMBER;
    } else {
      this.menuType = MenuType.NORMAL;
    }
  }

  change(): void {
    AppStorage.set('inputStyle', StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, DEVICE_TYPE));
  }

  build() {
    Stack() {
      Column() {
        TopMenu()
        TextGenMenu()
        Column() {
          if (this.menuType === MenuType.NORMAL) {
            KeyMenu({ keyList: this.keyList })
          } else if (this.menuType === MenuType.NUMBER) {
            NumberMenu({ numberList: this.numberList, })
          } else if(this.menuType == MenuType.SPECIAL){
            SymbolMenu({ symbolList: this.symbolList, })
          } else if(this.menuType == MenuType.EMOJI){
            EmojiMenu({ emojiList: this.emojiList})
          } else if(this.menuType == MenuType.CLIPBOARD){
            ClipboardMenu({})
          }
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#D5D8DD')
      }
      .height('100%')
    }
    .height('100%')
    .backgroundColor(Color.White)
  }
}
