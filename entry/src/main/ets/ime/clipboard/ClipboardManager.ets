import pasteboard from '@ohos.pasteboard'
import { BusinessError } from '@ohos.base';
import { store } from '../../ServiceExtAbility/ServiceExtAbility';
import { ClipboardItem } from './provider/ClipboardDatabase';
import { sourceListType } from '../../model/KeyboardKeyData';

export class ClipboardManager{
  static systemPasteBoard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
  static ClipboardItemList: sourceListType[] = []
  constructor() {
    let listener = () => {
      console.info("The system pasteboard has changed")
      ClipboardManager.systemPasteBoard.getData((err: BusinessError, pasteData: pasteboard.PasteData) => {
        if (err) {
          console.error('Failed to get PasteData. Cause: ' + err.message);
          return;
        }
        let text: string = pasteData.getPrimaryText();
        console.info("The system pasteboard has changed: " + text)
        ClipboardItem.text(text);
      });
    }
    ClipboardManager.systemPasteBoard.on("update", listener)
  }
}