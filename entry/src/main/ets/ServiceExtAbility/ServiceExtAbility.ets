/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import InputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility';
import Want from '@ohos.app.ability.Want';
import Log from '../model/Log';
import { KeyboardController } from '../model/KeyboardController';
import InputMethodExtensionContext from '@ohos.InputMethodExtensionContext';
import resourceManager from '@ohos.resourceManager';
import FaultLogger from '@ohos.faultLogger';
import window from '@ohos.window';
import fs from '@ohos.file.fs';

export enum AppTheme {
  AUTO = "auto",
  AUTO_AMOLED = "auto_amoled",
  LIGHT = "light",
  DARK = "dark",
  AMOLED_DARK = "amoled_dark"
}


const TAG: string = 'ServiceExtAbility->';

class ServiceExtAbility extends InputMethodExtensionAbility {
  private keyboardController: KeyboardController | undefined = undefined;

  onWindowStageCreate(windowStage: window.WindowStage) {
    let context = this.context;
    let pathDir = context.filesDir;
  }

  onCreate(want: Want): void {
    this.addLog(`onCreate want: ${want.abilityName}`);
    this.keyboardController = new KeyboardController(this.context);
    this.keyboardController.onCreate();
  }

  onDestroy(): void {
    this.addLog('onDestroy');
    if (this.keyboardController) {
      this.keyboardController.onDestroy();
    }
  }

  addLog(message: string): void {
    Log.showInfo(TAG, `kikaInput-new: ${message}`);
  }

  init(){
    this.initICU(this.context)
    // 删除cache文件夹中的所有文件 不可用 this.context.cacheDir.deleteContentRecursively()

  }

  initICU(context: InputMethodExtensionContext): Boolean{
    try {
      let ohResourceManager = context.resourceManager
      if(ohResourceManager == null) return false
      let cacheDirPath = context.cacheDir.toString()
      // 创建文件
      let icuTmpDataFile = fs.openSync(cacheDirPath+"icudt.dat", fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
      // ohResourceManager.getRawFileContent('')
      // 使用了android系统内部的某个文件，复制到现在的文件当中，创建了ICU文件
      // fs.writeSync(icuTmpDataFile.fd, )
    }catch (e) {
      console.error(e)
      return false
    }
    return true
  }
}

export default ServiceExtAbility;
