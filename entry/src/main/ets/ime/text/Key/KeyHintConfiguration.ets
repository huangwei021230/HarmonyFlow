/**
 * Enumeration representing different modes of key hints.
 */
export enum KeyHintMode {
  DISABLED,
  ACCENT_PRIORITY,
  HINT_PRIORITY
}

/**
 * Helper class for summarizing all hint preferences in one single object.
 */
export class KeyHintConfiguration {
  symbolHintMode: KeyHintMode;
  numberHintMode: KeyHintMode;
  mergeHintPopups: boolean;

  constructor(symbolHintMode: KeyHintMode, numberHintMode: KeyHintMode, mergeHintPopups: boolean) {
    this.symbolHintMode = symbolHintMode;
    this.numberHintMode = numberHintMode;
    this.mergeHintPopups = mergeHintPopups;
  }

  static HINTS_DISABLED: KeyHintConfiguration = new KeyHintConfiguration(KeyHintMode.DISABLED, KeyHintMode.DISABLED, false);
}
