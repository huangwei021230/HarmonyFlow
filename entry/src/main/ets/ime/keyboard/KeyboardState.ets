import { InputShiftState } from '../input/InputShiftState';
import { BehaviorSubject, Observable } from 'rxjs';
enum KeyboardMode {
  // Define KeyboardMode enum values here
}


enum KeyVariation {
  // Define KeyVariation enum values here
}

enum ImeUiMode {
  // Define ImeUiMode enum values here
}

enum LayoutDirection {
  LTR,
  RTL
}

class MutableStateFlow<T> {
  private subject: BehaviorSubject<T>;

  constructor(initialValue: T) {
    this.subject = new BehaviorSubject<T>(initialValue);
  }

  get value(): T {
    return this.subject.value;
  }

  get state$(): Observable<T> {
    return this.subject.asObservable();
  }

  set(value: T): void {
    this.subject.next(value);
  }
}
class KeyboardState {
  private rawValue: bigint;

  constructor(rawValue: bigint = 0n) {
    this.rawValue = rawValue;
  }

  static readonly M_KEYBOARD_MODE: bigint =                  0x0Fn;
  static readonly O_KEYBOARD_MODE: number =                    0;
  static readonly M_KEY_VARIATION: bigint =                  0x0Fn;
  static readonly O_KEY_VARIATION: number =                    4;
  static readonly M_INPUT_SHIFT_STATE: bigint =              0x03n;
  static readonly O_INPUT_SHIFT_STATE: number =                8;
  static readonly M_IME_UI_MODE: bigint =                    0x07n;
  static readonly O_IME_UI_MODE: number =                      24;

  static readonly F_IS_SELECTION_MODE: bigint =              0x00000400n;
  static readonly F_IS_MANUAL_SELECTION_MODE: bigint =       0x00000800n;
  static readonly F_IS_MANUAL_SELECTION_MODE_START: bigint = 0x00001000n;
  static readonly F_IS_MANUAL_SELECTION_MODE_END: bigint =   0x00002000n;
  static readonly F_IS_INCOGNITO_MODE: bigint =              0x00008000n;
  static readonly F_IS_ACTIONS_OVERFLOW_VISIBLE: bigint =    0x00010000n;
  static readonly F_IS_ACTIONS_EDITOR_VISIBLE: bigint =      0x00020000n;
  static readonly F_IS_COMPOSING_ENABLED: bigint =           0x00100000n;

  static readonly F_IS_CHAR_HALF_WIDTH: bigint =             0x00200000n;
  static readonly F_IS_KANA_KATA: bigint =                   0x00400000n;
  static readonly F_IS_KANA_SMALL: bigint =                  0x00800000n;

  static readonly F_IS_RTL_LAYOUT_DIRECTION: bigint =        0x08000000n;

  static readonly F_DEBUG_SHOW_DRAG_AND_DROP_HELPERS: bigint =      0x0100000000000000n;

  static readonly STATE_ALL_ZERO: bigint =                   0n;

  static new(value: bigint = KeyboardState.STATE_ALL_ZERO): KeyboardState {
    return new KeyboardState(value);
  }

  snapshot(): KeyboardState {
    return KeyboardState.new(this.rawValue);
  }

  private getFlag(f: bigint): boolean {
    return (this.rawValue & f) !== KeyboardState.STATE_ALL_ZERO;
  }

  private setFlag(f: bigint, v: boolean): void {
    this.rawValue = v ? (this.rawValue | f) : (this.rawValue & ~f);
  }

  private getRegion(m: bigint, o: number): number {
    return Number((this.rawValue >> o) & m);
  }

  private setRegion(m: bigint, o: number, v: number): void {
    this.rawValue = (this.rawValue & ~(m << BigInt(o))) | ((BigInt(v) & m) << BigInt(o));
  }

  hashCode(): number {
    return Number(this.rawValue);
  }

  equals(other: KeyboardState): boolean {
    return other instanceof KeyboardState && other.rawValue === this.rawValue;
  }

  toString(): string {
    return "0x" + this.rawValue.toString(16).padStart(16, '0');
  }

  get keyVariation(): KeyVariation {
    return this.getRegion(KeyboardState.M_KEY_VARIATION, KeyboardState.O_KEY_VARIATION);
  }

  set keyVariation(v: KeyVariation) {
    this.setRegion(KeyboardState.M_KEY_VARIATION, KeyboardState.O_KEY_VARIATION, v);
  }

  get keyboardMode(): KeyboardMode {
    return this.getRegion(KeyboardState.M_KEYBOARD_MODE, KeyboardState.O_KEYBOARD_MODE);
  }

  set keyboardMode(v: KeyboardMode) {
    this.setRegion(KeyboardState.M_KEYBOARD_MODE, KeyboardState.O_KEYBOARD_MODE, v);
  }

  get inputShiftState(): InputShiftState {
    return this.getRegion(KeyboardState.M_INPUT_SHIFT_STATE, KeyboardState.O_INPUT_SHIFT_STATE);
  }

  set inputShiftState(v: InputShiftState) {
    this.setRegion(KeyboardState.M_INPUT_SHIFT_STATE, KeyboardState.O_INPUT_SHIFT_STATE, v);
  }

  get imeUiMode(): ImeUiMode {
    return this.getRegion(KeyboardState.M_IME_UI_MODE, KeyboardState.O_IME_UI_MODE);
  }

  set imeUiMode(v: ImeUiMode) {
    this.setRegion(KeyboardState.M_IME_UI_MODE, KeyboardState.O_IME_UI_MODE, v);
  }

  get layoutDirection(): LayoutDirection {
    return this.getFlag(KeyboardState.F_IS_RTL_LAYOUT_DIRECTION) ? LayoutDirection.RTL : LayoutDirection.LTR;
  }

  set layoutDirection(v: LayoutDirection) {
    this.setFlag(KeyboardState.F_IS_RTL_LAYOUT_DIRECTION, v === LayoutDirection.RTL);
  }

  get isLowercase(): boolean {
    return this.inputShiftState === InputShiftState.UNSHIFTED;
  }

  get isUppercase(): boolean {
    return this.inputShiftState !== InputShiftState.UNSHIFTED;
  }

  get isSelectionMode(): boolean {
    return this.getFlag(KeyboardState.F_IS_SELECTION_MODE);
  }

  set isSelectionMode(v: boolean) {
    this.setFlag(KeyboardState.F_IS_SELECTION_MODE, v);
  }

  get isManualSelectionMode(): boolean {
    return this.getFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE);
  }

  set isManualSelectionMode(v: boolean) {
    this.setFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE, v);
  }

  get isManualSelectionModeStart(): boolean {
    return this.getFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE_START);
  }

  set isManualSelectionModeStart(v: boolean) {
    this.setFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE_START, v);
  }

  get isManualSelectionModeEnd(): boolean {
    return this.getFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE_END);
  }

  set isManualSelectionModeEnd(v: boolean) {
    this.setFlag(KeyboardState.F_IS_MANUAL_SELECTION_MODE_END, v);
  }

  get isCursorMode(): boolean {
    return !this.isSelectionMode;
  }

  set isCursorMode(v: boolean) {
    this.isSelectionMode = !v;
  }

  get isIncognitoMode(): boolean {
    return this.getFlag(KeyboardState.F_IS_INCOGNITO_MODE);
  }

  set isIncognitoMode(v: boolean) {
    this.setFlag(KeyboardState.F_IS_INCOGNITO_MODE, v);
  }

  get isActionsOverflowVisible(): boolean {
    return this.getFlag(KeyboardState.F_IS_ACTIONS_OVERFLOW_VISIBLE);
  }

  set isActionsOverflowVisible(v: boolean) {
    this.setFlag(KeyboardState.F_IS_ACTIONS_OVERFLOW_VISIBLE, v);
  }

  get isActionsEditorVisible(): boolean {
    return this.getFlag(KeyboardState.F_IS_ACTIONS_EDITOR_VISIBLE);
  }

  set isActionsEditorVisible(v: boolean) {
    this.setFlag(KeyboardState.F_IS_ACTIONS_EDITOR_VISIBLE, v);
  }

  get isComposingEnabled(): boolean {
    return this.getFlag(KeyboardState.F_IS_COMPOSING_ENABLED);
  }

  set isComposingEnabled(v: boolean) {
    this.setFlag(KeyboardState.F_IS_COMPOSING_ENABLED, v);
  }

  get isKanaKata(): boolean {
    return this.getFlag(KeyboardState.F_IS_KANA_KATA);
  }

  set isKanaKata(v: boolean) {
    this.setFlag(KeyboardState.F_IS_KANA_KATA, v);
  }

  get isCharHalfWidth(): boolean {
    return this.getFlag(KeyboardState.F_IS_CHAR_HALF_WIDTH);
  }

  set isCharHalfWidth(v: boolean) {
    this.setFlag(KeyboardState.F_IS_CHAR_HALF_WIDTH, v);
  }

  get isKanaSmall(): boolean {
    return this.getFlag(KeyboardState.F_IS_KANA_SMALL);
  }

  set isKanaSmall(v: boolean) {
    this.setFlag(KeyboardState.F_IS_KANA_SMALL, v);
  }

  get debugShowDragAndDropHelpers(): boolean {
    return this.getFlag(KeyboardState.F_DEBUG_SHOW_DRAG_AND_DROP_HELPERS);
  }

  set debugShowDragAndDropHelpers(v: boolean) {
    this.setFlag(KeyboardState.F_DEBUG_SHOW_DRAG_AND_DROP_HELPERS, v);
  }
}

class ObservableKeyboardState extends KeyboardState {
  private dispatchFlow: MutableStateFlow<KeyboardState>;
  private batchEditCount: AtomicInteger;

  constructor(initValue: bigint = 0n, dispatchFlow: MutableStateFlow<KeyboardState> = new MutableStateFlow(KeyboardState.new(initValue))) {
    super(initValue);
    this.dispatchFlow = dispatchFlow;
    this.batchEditCount = new AtomicInteger(0);
    this.dispatchState();
  }

  static readonly BATCH_ZERO: number = 0;

  static new(value: bigint = KeyboardState.STATE_ALL_ZERO): ObservableKeyboardState {
    return new ObservableKeyboardState(value);
  }

  set rawValue(value: bigint) {
    if (this.rawValue !== value) {
      this.rawValue = value;
      this.dispatchState();
    }
  }

  private dispatchState(): void {
    if (this.batchEditCount.get() === ObservableKeyboardState.BATCH_ZERO) {
      this.dispatchFlow.value = this.snapshot();
    }
  }

  beginBatchEdit(): void {
    this.batchEditCount.incrementAndGet();
  }

  endBatchEdit(): void {
    this.batchEditCount.decrementAndGet();
    this.dispatchState();
  }

  batchEdit(block: (ObservableKeyboardState) => void): void {
    this.beginBatchEdit();
    try {
      block(this);
    } finally {
      this.endBatchEdit();
    }
  }
}
