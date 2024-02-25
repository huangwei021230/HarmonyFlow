export enum LayoutType {
  CHARACTERS =            "characters",
  CHARACTERS_MOD =        "charactersMod",
  EXTENSION =             "extension",
  NUMERIC =               "numeric",
  NUMERIC_ADVANCED =      "numericAdvanced",
  NUMERIC_ROW =           "numericRow",
  PHONE =                 "phone",
  PHONE2 =                "phone2",
  SYMBOLS =               "symbols",
  SYMBOLS_MOD =           "symbolsMod",
  SYMBOLS2 =              "symbols2",
  SYMBOLS2_MOD =          "symbols2Mod"
}

// 使用 LayoutType 的字符串值来构造 LayoutType 枚举
export function parseLayoutType(layoutTypeId: string): LayoutType {
  switch (layoutTypeId) {
    case LayoutType.CHARACTERS:
      return LayoutType.CHARACTERS;
    case LayoutType.CHARACTERS_MOD:
      return LayoutType.CHARACTERS_MOD;
    case LayoutType.EXTENSION:
      return LayoutType.EXTENSION;
    case LayoutType.NUMERIC:
      return LayoutType.NUMERIC;
    case LayoutType.NUMERIC_ADVANCED:
      return LayoutType.NUMERIC_ADVANCED;
    case LayoutType.NUMERIC_ROW:
      return LayoutType.NUMERIC_ROW;
    case LayoutType.PHONE:
      return LayoutType.PHONE;
    case LayoutType.PHONE2:
      return LayoutType.PHONE2;
    case LayoutType.SYMBOLS:
      return LayoutType.SYMBOLS;
    case LayoutType.SYMBOLS_MOD:
      return LayoutType.SYMBOLS_MOD;
    case LayoutType.SYMBOLS2:
      return LayoutType.SYMBOLS2;
    case LayoutType.SYMBOLS2_MOD:
      return LayoutType.SYMBOLS2_MOD;
    default:
      throw new Error("Unknown layout type ID: " + layoutTypeId);
  }
}
