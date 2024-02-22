export class KeyType {
  static CHARACTER = new KeyType("CHARACTER");
  static ENTER_EDITING = new KeyType("ENTER_EDITING");
  static FUNCTION = new KeyType("FUNCTION");
  static LOCK = new KeyType("LOCK");
  static MODIFIER = new KeyType("MODIFIER");
  static NAVIGATION = new KeyType("NAVIGATION");
  static SYSTEM_GUI = new KeyType("SYSTEM_GUI");
  static NUMERIC = new KeyType("NUMERIC");
  static PLACEHOLDER = new KeyType("PLACEHOLDER");
  static UNSPECIFIED = new KeyType("UNSPECIFIED");

  private value: string;

  constructor(value: string) {
    this.value = value;
  }

  toString(): string {
    return this.value.toLowerCase();
  }

  static fromString(value: string): KeyType {
    switch (value.toUpperCase()) {
      case "CHARACTER": return KeyType.CHARACTER;
      case "ENTER_EDITING": return KeyType.ENTER_EDITING;
      case "FUNCTION": return KeyType.FUNCTION;
      case "LOCK": return KeyType.LOCK;
      case "MODIFIER": return KeyType.MODIFIER;
      case "NAVIGATION": return KeyType.NAVIGATION;
      case "SYSTEM_GUI": return KeyType.SYSTEM_GUI;
      case "NUMERIC": return KeyType.NUMERIC;
      case "PLACEHOLDER": return KeyType.PLACEHOLDER;
      case "UNSPECIFIED": return KeyType.UNSPECIFIED;
      default: throw new Error("Invalid KeyType value: " + value);
    }
  }
}

export class KeyTypeSerializer {
  serialize(value: KeyType): string {
    return value.toString();
  }

  deserialize(value: string): KeyType {
    return KeyType.fromString(value);
  }
}
