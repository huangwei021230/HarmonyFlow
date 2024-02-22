import { ComputingEvaluator } from '../../keyboard/ComputingEvaluator';
import { AbstractKeyData, KeyData } from '../../keyboard/KeyData';
import { PopupSet } from '../../popup/PopupSet';
import { KeyCode } from '../Key/KeyCode';
import { KeyType } from '../Key/KeyType';

export class TextKeyData implements KeyData {
  type: KeyType;
  code: number;
  label: string;
  groupId: number;
  popup: PopupSet<AbstractKeyData>;

  constructor(
    type: KeyType = KeyType.CHARACTER,
    code: number = KeyCode.UNSPECIFIED,
    label: string = "",
    groupId: number = KeyData.GROUP_DEFAULT,
    popup: PopupSet<AbstractKeyData> | null = null
  ) {
    this.type = type;
    this.code = code;
    this.label = label;
    this.groupId = groupId;
    this.popup = popup;
  }



  isSpaceKey(): boolean {
    return this.type == KeyType.CHARACTER && (this.code == KeyCode.SPACE || this.code == KeyCode.CJK_SPACE
      || this.code == KeyCode.HALF_SPACE || this.code == KeyCode.KESHIDA)
  }

  compute(evaluator: ComputingEvaluator): KeyData | null {
    if (evaluator.isSlot(this)) {
      const data = evaluator.slotData(this);
      if (data) {
        return new TextKeyData(this.type, data.code, data.label, this.groupId, this.popup);
      }
    }
    return this;
  }

  asString(isForDisplay: boolean): string {
    if (isForDisplay || this.code == KeyCode.URI_COMPONENT_TLD || this.code < KeyCode.SPACE) {
      if (Unicode.isNonSpacingMark(this.code) && !this.label.startsWith("◌")) {
        return "◌" + this.label;
      }
      return this.label;
    } else {
      try { return String.fromCodePoint(this.code); } catch (error) { }
    }
    return "";
  }

  toString(): string {
    return `TextKeyData { type=${this.type} code=${this.code} label="${this.label}" groupId=${this.groupId} }`;
  }

  static getCodeInfoAsTextKeyData(code: number): TextKeyData | null {
    if (code <= 0) {
      const key = InternalKeys.find(k => k.code === code);
      if (key) {
        return key;
      }
    } else {
      return new TextKeyData(KeyType.CHARACTER, code, String.fromCodePoint(code));
    }
    return null;
  }

  // Predefined key data
  static readonly UNSPECIFIED = new TextKeyData(KeyType.UNSPECIFIED, KeyCode.UNSPECIFIED, "unspecified");
  static readonly SPACE = new TextKeyData(KeyType.CHARACTER, KeyCode.SPACE, "space");
  static readonly CTRL = new TextKeyData(KeyType.MODIFIER, KeyCode.CTRL, "ctrl");
  static readonly CTRL_LOCK = new TextKeyData(KeyType.MODIFIER, KeyCode.CTRL_LOCK, "ctrl_lock");
  static readonly ALT = new TextKeyData(KeyType.MODIFIER, KeyCode.ALT, "alt");
  static readonly ALT_LOCK = new TextKeyData(KeyType.MODIFIER, KeyCode.ALT_LOCK, "alt_lock");
  static readonly FN = new TextKeyData(KeyType.MODIFIER, KeyCode.FN, "fn");
  static readonly FN_LOCK = new TextKeyData(KeyType.MODIFIER, KeyCode.FN_LOCK, "fn_lock");
  static readonly DELETE = new TextKeyData(KeyType.ENTER_EDITING, KeyCode.DELETE, "delete");
  static readonly DELETE_WORD = new TextKeyData(KeyType.ENTER_EDITING, KeyCode.DELETE_WORD, "delete_word");
  static readonly FORWARD_DELETE = new TextKeyData(KeyType.ENTER_EDITING, KeyCode.FORWARD_DELETE, "forward_delete");
  static readonly FORWARD_DELETE_WORD = new TextKeyData(KeyType.ENTER_EDITING, KeyCode.FORWARD_DELETE_WORD, "forward_delete_word");
  static readonly SHIFT = new TextKeyData(KeyType.MODIFIER, KeyCode.SHIFT, "shift");
  static readonly CAPS_LOCK = new TextKeyData(KeyType.MODIFIER, KeyCode.CAPS_LOCK, "caps_lock");
  static readonly ARROW_LEFT = new TextKeyData(KeyType.NAVIGATION, KeyCode.ARROW_LEFT, "arrow_left");
  static readonly ARROW_RIGHT = new TextKeyData(KeyType.NAVIGATION, KeyCode.ARROW_RIGHT, "arrow_right");
  static readonly ARROW_UP = new TextKeyData(KeyType.NAVIGATION, KeyCode.ARROW_UP, "arrow_up");
  static readonly ARROW_DOWN = new TextKeyData(KeyType.NAVIGATION, KeyCode.ARROW_DOWN, "arrow_down");
  static readonly MOVE_START_OF_PAGE = new TextKeyData(KeyType.NAVIGATION, KeyCode.MOVE_START_OF_PAGE, "move_start_of_page");
  static readonly MOVE_END_OF_PAGE = new TextKeyData(KeyType.NAVIGATION, KeyCode.MOVE_END_OF_PAGE, "move_end_of_page");
  static readonly MOVE_START_OF_LINE = new TextKeyData(KeyType.NAVIGATION, KeyCode.MOVE_START_OF_LINE, "move_start_of_line");
  static readonly MOVE_END_OF_LINE = new TextKeyData(KeyType.NAVIGATION, KeyCode.MOVE_END_OF_LINE, "move_end_of_line");
  static readonly CLIPBOARD_COPY = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_COPY, "clipboard_copy");
  static readonly CLIPBOARD_CUT = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_CUT, "clipboard_cut");
  static readonly CLIPBOARD_PASTE = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_PASTE, "clipboard_paste");
  static readonly CLIPBOARD_SELECT = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_SELECT, "clipboard_select");
  static readonly CLIPBOARD_SELECT_ALL = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_SELECT_ALL, "clipboard_select_all");
  static readonly CLIPBOARD_CLEAR_HISTORY = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_CLEAR_HISTORY, "clipboard_clear_history");
  static readonly CLIPBOARD_CLEAR_FULL_HISTORY = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_CLEAR_FULL_HISTORY, "clipboard_clear_full_history");
  static readonly CLIPBOARD_CLEAR_PRIMARY_CLIP = new TextKeyData(KeyType.SYSTEM_GUI, KeyCode.CLIPBOARD_CLEAR_PRIMARY_CLIP, "clipboard_clear_primary_clip");
  // Add more predefined key data here...
}

class AutoTextKeyData implements KeyData {
  type: KeyType;
  code: number;
  label: string;
  groupId: number;
  popup: PopupSet<AbstractKeyData> | null;
  private state: AutoLetterState;

  constructor(
    type: KeyType = KeyType.CHARACTER,
    code: number = KeyCode.UNSPECIFIED,
    label: string = "",
    groupId: number = KeyData.GROUP_DEFAULT,
    popup: PopupSet<AbstractKeyData> | null = null
  ) {
    this.type = type;
    this.code = code;
    this.label = label;
    this.groupId = groupId;
    this.popup = popup;
    this.state = new this.AutoLetterState();
  }

  isSpaceKey(): boolean {
    throw new Error('Method not implemented.');
  }

  compute(evaluator: ComputingEvaluator): KeyData | null {
    if (evaluator.isSlot(this)) {
      const data = evaluator.slotData(this);
      if (data) {
        return new TextKeyData(this.type, data.code, data.label, this.groupId, this.popup);
      }
    } else {
      this.state.recomputeIfNecessary(evaluator.subtype.primaryLocale);
      return evaluator.state.isUppercase ? this.state.upper : this.state.lower;
    }
    return null;
  }

  asString(isForDisplay: boolean): string {
    if (isForDisplay || this.code == KeyCode.URI_COMPONENT_TLD || this.code < KeyCode.SPACE) {
      if (Unicode.isNonSpacingMark(this.code) && !this.label.startsWith("◌")) {
        return "◌" + this.label;
      }
      return this.label;
    } else {
      try { return String.fromCodePoint(this.code); } catch (error) { }
    }
    return "";
  }

  toString(): string {
    return `AutoTextKeyData { type=${this.type} code=${this.code} label="${this.label}" groupId=${this.groupId} }`;
  }

  private class AutoLetterState {
  private locale: FlorisLocale;
  lower: TextKeyData;
  upper: TextKeyData;

  constructor() {
    this.locale = FlorisLocale.ROOT;
    this.lower = TextKeyData.UNSPECIFIED;
    this.upper = TextKeyData.UNSPECIFIED;
  }

  recomputeIfNecessary(locale: FlorisLocale): void {
    if (this.locale === locale) return;
    this.locale = locale;
    this.lower = new TextKeyData(
      this.type,
      UCharacter.toString(this.code).lowercase(locale).codePointAt(0),
      this.label.lowercase(locale),
      this.groupId,
      this.popup
    );
    this.upper = new TextKeyData(
      this.type,
      UCharacter.toString(this.code).uppercase(locale).codePointAt(0),
      this.label.uppercase(locale),
      this.groupId,
      this.popup
    );
  }
}
}

class MultiTextKeyData implements KeyData {
  type: KeyType;
  code: number;
  label: string;
  groupId: number;
  popup: PopupSet<AbstractKeyData> | null;
  codePoints: number[];

  constructor(
    type: KeyType = KeyType.CHARACTER,
    codePoints: number[] = [],
    label: string = "",
    groupId: number = KeyData.GROUP_DEFAULT,
    popup: PopupSet<AbstractKeyData> | null = null
  ) {
    this.type = type;
    this.codePoints = codePoints;
    this.code = KeyCode.MULTIPLE_CODE_POINTS;
    this.label = label;
    this.groupId = groupId;
    this.popup = popup;
  }

  isSpaceKey(): boolean {
    throw new Error('Method not implemented.');
  }

  compute(evaluator: ComputingEvaluator): KeyData {
    return this;
  }

  asString(isForDisplay: boolean): string {
    if (isForDisplay) {
      return this.label;
    } else {
      return this.codePoints.map(cp => String.fromCodePoint(cp)).join("");
    }
  }

  toString(): string {
    return `MultiTextKeyData { type=${this.type} code=${this.code} label="${this.label}" groupId=${this.groupId} }`;
  }
}
