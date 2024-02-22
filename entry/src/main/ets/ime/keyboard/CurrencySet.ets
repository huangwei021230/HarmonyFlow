import { KeyCode } from '../text/Key/KeyCode'; // Assuming KeyCode is defined elsewhere
import { TextKeyData } from '../text/Keyboard/TextKeyData'; // Assuming TextKeyData is defined elsewhere
import { Component } from '@ohos.UiTest';

export class CurrencySet {
  id: string;
  label: string;
  private slots: TextKeyData[];

  constructor(id: string, label: string, slots: TextKeyData[]) {
    this.id = id;
    this.label = label;
    this.slots = slots;
  }

  static Fallback = new CurrencySet(
    "fallback",
    "Fallback",
    [
      new TextKeyData(36, "$"),
      new TextKeyData(162, "¢"),
      new TextKeyData(8364, "€"),
      new TextKeyData(163, "£"),
      new TextKeyData(165, "¥"),
      new TextKeyData(8369, "₱")
    ]
  );

  static isCurrencySlot(keyCode: number): boolean {
    return (
      keyCode === KeyCode.CURRENCY_SLOT_1 ||
        keyCode === KeyCode.CURRENCY_SLOT_2 ||
        keyCode === KeyCode.CURRENCY_SLOT_3 ||
        keyCode === KeyCode.CURRENCY_SLOT_4 ||
        keyCode === KeyCode.CURRENCY_SLOT_5 ||
        keyCode === KeyCode.CURRENCY_SLOT_6
    );
  }

  getSlot(keyCode: number): TextKeyData | undefined {
    const slot = Math.abs(keyCode) - Math.abs(KeyCode.CURRENCY_SLOT_1);
    return this.slots[slot];
  }

  toString(): string {
    return `CurrencySet { id=${this.id}, label="${this.label}", slots=${this.slots} }`;
  }
}
