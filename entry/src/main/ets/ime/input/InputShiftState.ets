/**
 * Enum for the input shift states of a text keyboard.
 */
export enum InputShiftState {
  UNSHIFTED = 0,
  SHIFTED_MANUAL = 1,
  SHIFTED_AUTOMATIC = 2,
  CAPS_LOCK = 3
}

export namespace InputShiftState {
  export function fromInt(value: number): InputShiftState {
    switch (value) {
      case 0: return InputShiftState.UNSHIFTED;
      case 1: return InputShiftState.SHIFTED_MANUAL;
      case 2: return InputShiftState.SHIFTED_AUTOMATIC;
      case 3: return InputShiftState.CAPS_LOCK;
      default: throw new Error(`Invalid InputShiftState value: ${value}`);
    }
  }
}
