import { Context } from '@ohos.abilityAccessCtrl';

import { FlorisEditorInfo, ImeOptions } from 'your-editor-info-library-path'; // 替换成你的编辑器信息库的路径
import { Keyboard, PlaceholderLoadingKeyboard, KeyboardMode } from 'your-keyboard-library-path'; // 替换成你的键盘库的路径
import { DisplayLanguageNamesIn } from 'your-display-language-names-library-path'; // 替换成你的显示语言名称库的路径
import { Subtype } from 'your-subtype-library-path'; // 替换成你的子类型库的路径
import { KeyData, KeyCode, KeyType } from 'your-key-data-library-path'; // 替换成你的按键数据库的路径
import { KeyboardState, InputShiftState } from 'your-keyboard-state-library-path'; // 替换成你的键盘状态库的路径
import { FlorisLocale } from 'your-locale-library-path'; // 替换成你的地区库的路径
import resourceManager from '@ohos.resourceManager';

export interface ComputingEvaluator {
  version: number;

  keyboard: Keyboard;

  editorInfo: FlorisEditorInfo;

  state: KeyboardState;

  subtype: Subtype;

  context(): Context| null;

  displayLanguageNamesIn(): DisplayLanguageNamesIn;

  evaluateEnabled(data: KeyData): boolean;

  evaluateVisible(data: KeyData): boolean;

  isSlot(data: KeyData): boolean;

  slotData(data: KeyData): KeyData | null;
}

export class DefaultComputingEvaluator implements ComputingEvaluator {
  version: number = -1;
  keyboard: Keyboard = PlaceholderLoadingKeyboard;
  editorInfo: FlorisEditorInfo = FlorisEditorInfo.Unspecified;
  state: KeyboardState = KeyboardState.new();
  subtype: Subtype = Subtype.DEFAULT;

  context(): Context | null {
    return null;
  }

  displayLanguageNamesIn(): DisplayLanguageNamesIn {
    return DisplayLanguageNamesIn.NATIVE_LOCALE;
  }

  evaluateEnabled(data: KeyData): boolean {
    return true;
  }

  evaluateVisible(data: KeyData): boolean {
    return true;
  }

  isSlot(data: KeyData): boolean {
    return false;
  }

  slotData(data: KeyData): KeyData | null {
    return null;
  }
}


let cachedDisplayNameState: [FlorisLocale, DisplayLanguageNamesIn, string] = [FlorisLocale.ROOT, DisplayLanguageNamesIn.SYSTEM_LOCALE, ""];

function computeLanguageDisplayName(locale: FlorisLocale, displayLanguageNamesIn: DisplayLanguageNamesIn): string {
  const cachedLocale = cachedDisplayNameState[0];
  const cachedDisplayLanguageNamesIn = cachedDisplayNameState[1];
  const cachedDisplayName = cachedDisplayNameState[2];
  if (cachedLocale === locale && cachedDisplayLanguageNamesIn === displayLanguageNamesIn) {
    return cachedDisplayName;
  }
  const displayName: string = displayLanguageNamesIn === DisplayLanguageNamesIn.SYSTEM_LOCALE ? locale.displayName() : locale.displayName(locale);
  cachedDisplayNameState = [locale, displayLanguageNamesIn, displayName];
  return displayName;
}

export function computeLabel(evaluator: ComputingEvaluator, data: KeyData): string | null {
  if (data.type === KeyType.CHARACTER && data.code !== KeyCode.SPACE && data.code !== KeyCode.CJK_SPACE
    && data.code !== KeyCode.HALF_SPACE && data.code !== KeyCode.KESHIDA || data.type === KeyType.NUMERIC
  ) {
    return data.asString(true);
  } else {
    switch (data.code) {
      case KeyCode.PHONE_PAUSE:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__phone_pause')) ?? null;
      case KeyCode.PHONE_WAIT:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__phone_wait'))?? null;
      case KeyCode.SPACE:
      case KeyCode.CJK_SPACE:
        return evaluator.keyboard.mode === KeyboardMode.CHARACTERS ? computeLanguageDisplayName(evaluator.subtype.primaryLocale, evaluator.displayLanguageNamesIn()) : null;
      case KeyCode.IME_UI_MODE_TEXT:
      case KeyCode.VIEW_CHARACTERS:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_characters')) ?? null;
      case KeyCode.VIEW_NUMERIC:
      case KeyCode.VIEW_NUMERIC_ADVANCED:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_numeric')) ?? null;
      case KeyCode.VIEW_PHONE:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_phone')) ?? null;
      case KeyCode.VIEW_PHONE2:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_phone2')) ?? null;
      case KeyCode.VIEW_SYMBOLS:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_symbols')) ?? null;
      case KeyCode.VIEW_SYMBOLS2:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_symbols2')) ?? null;
      case KeyCode.HALF_SPACE:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_half_space')) ?? null;
      case KeyCode.KESHIDA:
        return evaluator.context()?.resourceManager.getStringSync($r('app.string.key__view_keshida')) ?? null;
      default:
        return null;
    }
  }
}

export function computeIconResId(evaluator: ComputingEvaluator, data: KeyData): number | null {
  switch (data.code) {
    case KeyCode.ARROW_LEFT:
      return R.drawable.ic_keyboard_arrow_left;
    case KeyCode.ARROW_RIGHT:
      return R.drawable.ic_keyboard_arrow_right;
    case KeyCode.ARROW_UP:
      return R.drawable.ic_keyboard_arrow_up;
    case KeyCode.ARROW_DOWN:
      return R.drawable.ic_keyboard_arrow_down;
    case KeyCode.CLIPBOARD_COPY:
      return R.drawable.ic_content_copy;
    case KeyCode.CLIPBOARD_CUT:
      return R.drawable.ic_content_cut;
    case KeyCode.CLIPBOARD_PASTE:
      return R.drawable.ic_content_paste;
    case KeyCode.CLIPBOARD_SELECT_ALL:
      return R.drawable.ic_select_all;
    case KeyCode.CLIPBOARD_CLEAR_PRIMARY_CLIP:
      return R.drawable.ic_delete_sweep;
    case KeyCode.COMPACT_LAYOUT_TO_LEFT:
    case KeyCode.COMPACT_LAYOUT_TO_RIGHT:
      return R.drawable.ic_smartphone; // TODO: find a better icon for compact mode
    case KeyCode.VOICE_INPUT:
      return R.drawable.ic_keyboard_voice;
    case KeyCode.DELETE:
      return R.drawable.ic_backspace;
    case KeyCode.ENTER:
      {
        const imeOptions = evaluator.editorInfo.imeOptions;
        const inputAttributes = evaluator.editorInfo.inputAttributes;
        if (imeOptions.flagNoEnterAction || inputAttributes.flagTextMultiLine) {
          return R.drawable.ic_keyboard_return;
        } else {
          switch (imeOptions.action) {
            case ImeOptions.Action.DONE:
              return R.drawable.ic_done;
            case ImeOptions.Action.GO:
            case ImeOptions.Action.NEXT:
            case ImeOptions.Action.PREVIOUS:
              return R.drawable.ic_arrow_right_alt;
            case ImeOptions.Action.SEARCH:
              return R.drawable.ic_search;
            case ImeOptions.Action.SEND:
              return R.drawable.ic_send;
            case ImeOptions.Action.NONE:
            default:
              return R.drawable.ic_keyboard_return;
          }
        }
      }
    case KeyCode.IME_UI_MODE_MEDIA:
      return R.drawable.ic_sentiment_satisfied;
    case KeyCode.IME_UI_MODE_CLIPBOARD:
      return R.drawable.ic_assignment;
    case KeyCode.LANGUAGE_SWITCH:
      return R.drawable.ic_language;
    case KeyCode.SETTINGS:
      return R.drawable.ic_settings;
    case KeyCode.SHIFT:
      return evaluator.state.inputShiftState !== InputShiftState.UNSHIFTED ? R.drawable.ic_keyboard_capslock : R.drawable.ic_keyboard_arrow_up;
    case KeyCode.SPACE:
    case KeyCode.CJK_SPACE:
      return [KeyboardMode.NUMERIC, KeyboardMode.NUMERIC_ADVANCED, KeyboardMode.PHONE, KeyboardMode.PHONE2].includes(evaluator.keyboard.mode) ? R.drawable.ic_space_bar : null;
    case KeyCode.UNDO:
      return R.drawable.ic_undo;
    case KeyCode.REDO:
      return R.drawable.ic_redo;
    case KeyCode.TOGGLE_ACTIONS_OVERFLOW:
      return R.drawable.ic_more_horiz;
    case KeyCode.TOGGLE_INCOGNITO_MODE:
      return evaluator.state.isIncognitoMode ? R.drawable.ic_incognito : R.drawable.ic_incognito_off;
    case KeyCode.TOGGLE_AUTOCORRECT:
      return R.drawable.ic_font_download;
    case KeyCode.KANA_SWITCHER:
      return evaluator.state.isKanaKata ? R.drawable.ic_keyboard_kana_switcher_kata : R.drawable.ic_keyboard_kana_switcher_hira;
    case KeyCode.CHAR_WIDTH_SWITCHER:
      return evaluator.state.isCharHalfWidth ? R.drawable.ic_keyboard_char_width_switcher_full : R.drawable.ic_keyboard_char_width_switcher_half;
    case KeyCode.CHAR_WIDTH_FULL:
      return R.drawable.ic_keyboard_char_width_switcher_full;
    case KeyCode.CHAR_WIDTH_HALF:
      return R.drawable.ic_keyboard_char_width_switcher_half;
    case KeyCode.DRAG_MARKER:
      return evaluator.state.debugShowDragAndDropHelpers ? R.drawable.ic_close : null;
    case KeyCode.NOOP:
      return R.drawable.ic_close;
    default:
      return null;
  }
}
