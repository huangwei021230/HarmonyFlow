export namespace KeyCode {
  export namespace Spec {
    export const CHARACTERS_MIN = 1;
    export const CHARACTERS_MAX = 65535;
    export const CHARACTERS = `${CHARACTERS_MIN}..${CHARACTERS_MAX}`;

    export const INTERNAL_MIN = -9999;
    export const INTERNAL_MAX = -1;
    export const INTERNAL = `${INTERNAL_MIN}..${INTERNAL_MAX}`;
  }

  export const UNSPECIFIED = 0;
  export const PHONE_WAIT = 59; // ;
  export const PHONE_PAUSE = 44; // ,

  export const SPACE = 32;
  export const ESCAPE = 27;
  export const ENTER = 10;
  export const TAB = 9;


  export const CTRL = -1;
  export const CTRL_LOCK = -2;
  export const ALT = -3;
  export const ALT_LOCK = -4;
  export const FN = -5;
  export const FN_LOCK = -6;
  export const DELETE = -7;
  export const DELETE_WORD = -8;
  export const FORWARD_DELETE = -9;
  export const FORWARD_DELETE_WORD = -10;
  export const SHIFT = -11;
  export const CAPS_LOCK = -13;

  export const ARROW_LEFT = -21;
  export const ARROW_RIGHT = -22;
  export const ARROW_UP = -23;
  export const ARROW_DOWN = -24;
  export const MOVE_START_OF_PAGE = -25;
  export const MOVE_END_OF_PAGE = -26;
  export const MOVE_START_OF_LINE = -27;
  export const MOVE_END_OF_LINE = -28;


  export const CLIPBOARD_COPY = -31;
  export const CLIPBOARD_CUT = -32;
  export const CLIPBOARD_PASTE = -33;
  export const CLIPBOARD_SELECT = -34;
  export const CLIPBOARD_SELECT_ALL = -35;
  export const CLIPBOARD_CLEAR_HISTORY = -36;
  export const CLIPBOARD_CLEAR_FULL_HISTORY = -37;
  export const CLIPBOARD_CLEAR_PRIMARY_CLIP = -38;


  export const COMPACT_LAYOUT_TO_LEFT = -111;
  export const COMPACT_LAYOUT_TO_RIGHT = -112;
  export const SPLIT_LAYOUT = -113;
  export const MERGE_LAYOUT = -114;


  export const UNDO = -131;
  export const REDO = -132;


  export const VIEW_CHARACTERS = -201;
  export const VIEW_SYMBOLS = -202;
  export const VIEW_SYMBOLS2 = -203;
  export const VIEW_NUMERIC = -204;
  export const VIEW_NUMERIC_ADVANCED = -205;
  export const VIEW_PHONE = -206;
  export const VIEW_PHONE2 = -207;


  export const IME_UI_MODE_TEXT = -211;
  export const IME_UI_MODE_MEDIA = -212;
  export const IME_UI_MODE_CLIPBOARD = -213;


  export const SYSTEM_INPUT_METHOD_PICKER = -221;
  export const SYSTEM_PREV_INPUT_METHOD = -222;
  export const SYSTEM_NEXT_INPUT_METHOD = -223;
  export const IME_SUBTYPE_PICKER = -224;
  export const IME_PREV_SUBTYPE = -225;
  export const IME_NEXT_SUBTYPE = -226;
  export const LANGUAGE_SWITCH = -227;


  export const IME_SHOW_UI = -231;
  export const IME_HIDE_UI = -232;
  export const VOICE_INPUT = -233;
  export const TOGGLE_SMARTBAR_VISIBILITY = -241;
  export const TOGGLE_ACTIONS_OVERFLOW = -242;
  export const TOGGLE_ACTIONS_EDITOR = -243;
  export const TOGGLE_INCOGNITO_MODE = -244;
  export const TOGGLE_AUTOCORRECT = -245;


  export const URI_COMPONENT_TLD = -255;


  export const SETTINGS = -301;


  export const CURRENCY_SLOT_1 = -801;
  export const CURRENCY_SLOT_2 = -802;
  export const CURRENCY_SLOT_3 = -803;
  export const CURRENCY_SLOT_4 = -804;
  export const CURRENCY_SLOT_5 = -805;
  export const CURRENCY_SLOT_6 = -806;


  export const MULTIPLE_CODE_POINTS = -902;


  export const DRAG_MARKER = -991;
  export const NOOP = -999;


  export const CHAR_WIDTH_SWITCHER = -9701;
  export const CHAR_WIDTH_FULL = -9702;
  export const CHAR_WIDTH_HALF = -9703;


  export const KANA_SMALL = 12307;


  export const KANA_SWITCHER = -9710;
  export const KANA_HIRA = -9711;
  export const KANA_KATA = -9712;
  export const KANA_HALF_KATA = -9713;


  export const KESHIDA = 1600;
  export const HALF_SPACE = 8204;


  export const CJK_SPACE = 12288;
}
