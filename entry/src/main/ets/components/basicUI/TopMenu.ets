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

@Preview
@Component
export struct TopMenu {
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Consume menuType: number;
  lastMenuType: number = 0;

  build() {
    Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
      Stack(){
        Image($rawfile('ic_keyboard.svg'))
          .width('32vp')
          .height('32vp')
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        this.menuType = MenuType.NORMAL
      })

      Stack() {
        Image($rawfile('ic_emoji_emotions.svg'))
          .width('32vp')
          .height('32vp')
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        if(this.menuType == MenuType.EMOJI){
          this.menuType = this.lastMenuType;
        }else{
          this.lastMenuType = this.menuType;
          this.menuType = MenuType.EMOJI;
        }
      })


      Stack() {
        Image($rawfile('ic_clipboard.svg'))
          .width('32vp')
          .height('32vp')
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        // 查表
        if(store != undefined) {
          (store as relationalStore.RdbStore).querySql("SELECT text FROM CLIPBOARD_HISTORY_TABLE", (err, resultSet) => {
            if (err) {
              console.error(`Query failed, code is ${err.code},message is ${err.message}`);
              return;
            }
            console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
            // resultSet是一个数据集合的游标，默认指向第-1个记录，有效的数据从0开始。
            while (resultSet.goToNextRow()) {
              const text = resultSet.getString(resultSet.getColumnIndex("text"));
              console.info(`text = ${text}`);
              ClipboardManager.ClipboardItemList.push({content: text})
            }
            // 释放数据集的内存
            resultSet.close();
          })

          if(this.menuType == MenuType.CLIPBOARD){
            this.menuType = this.lastMenuType;
          }else{
            this.lastMenuType = this.menuType;
            this.menuType = MenuType.CLIPBOARD;
          }
        }
      })


      Stack() {
        Image($rawfile('down.svg'))
          .width(this.inputStyle.downMenuPicWidth)
          .height(this.inputStyle.downMenuPicHeight)
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        InputHandler.getInstance().hideKeyboardSelf();
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