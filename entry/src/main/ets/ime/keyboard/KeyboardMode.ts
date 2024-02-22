export enum KeyboardMode {
  UNSPECIFIED = -1,
  CHARACTERS = 0,
  EDITING = 1,
  SYMBOLS = 2,
  SYMBOLS2 = 3,
  NUMERIC = 4,
  NUMERIC_ADVANCED = 5,
  PHONE = 6,
  PHONE2 = 7,
  SMARTBAR_CLIPBOARD_CURSOR_ROW = 8,
  SMARTBAR_NUMBER_ROW = 9,
  SMARTBAR_QUICK_ACTIONS = 10,
}

export function fromInt(int: number): KeyboardMode {
  const entry = Object.entries(KeyboardMode).find(([_, value]) => value === int);
  return entry ? (entry[1] as KeyboardMode) : KeyboardMode.CHARACTERS;
}


export function toInt(mode: KeyboardMode): number {
  return mode as number;  // 强制类型转换
}
