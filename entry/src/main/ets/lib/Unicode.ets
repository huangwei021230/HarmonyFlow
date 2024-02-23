/**
 * Character codes and comments source:
 *  https://www.w3.org/International/questions/qa-bidi-unicode-controls#basedirection
 */
export class UnicodeCtrlChar {
  /** Sets base direction to LTR and isolates the embedded content from the surrounding text */
  static LeftToRightIsolate: string = "\u2066";

  /** Sets base direction to RTL and isolates the embedded content from the surrounding text */
  static RightToLeftIsolate: string = "\u2067";

  /** Isolates the content and sets the direction according to the first strongly typed directional character */
  static FirstStrongIsolate: string = "\u2068";

  /** Closes a previously opened isolated text block */
  static PopDirectionalIsolate: string = "\u2069";

  static Matcher: RegExp = new RegExp(`[${UnicodeCtrlChar.LeftToRightIsolate}${UnicodeCtrlChar.RightToLeftIsolate}${UnicodeCtrlChar.FirstStrongIsolate}${UnicodeCtrlChar.PopDirectionalIsolate}]`);
}

export function stripUnicodeCtrlChars(input: string): string {
  return input.replace(UnicodeCtrlChar.Matcher, "");
}

export class Unicode {
  static isNonSpacingMark(code: number): boolean {
    const char = String.fromCodePoint(code);
    const normalized = char.normalize("NFD");
    const regex = new RegExp("[^\\p{Letter}\\p{Mark}\\p{Decimal_Number}\\p{Connector_Punctuation}\\p{Join_Control}]", "u");
    return regex.test(normalized);
  }
}
