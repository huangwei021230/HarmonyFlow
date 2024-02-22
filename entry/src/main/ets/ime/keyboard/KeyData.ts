/*
 * Basic interface for a key data object.
 * Base for all key data objects across the IME, such as text, emojis and
 * selectors. The implementation is as abstract as possible, as different features require different implementations.
 * */
import { PopupSet } from '../popup/PopupSet'
import { KeyType } from '../text/Key/KeyType'
import { ComputingEvaluator } from './ComputingEvaluator'

export interface AbstractKeyData{
  compute(evaluator: ComputingEvaluator): KeyData | null
  asString(isForDisplay: Boolean): String
}

export interface KeyData extends AbstractKeyData {
  type: KeyType;
  code: number;
  label: string;
  groupId: number;
  popup: PopupSet<AbstractKeyData> | null;

  isSpaceKey(): boolean;
}

export namespace KeyData {
  export const GROUP_DEFAULT: number = 0;
  export const GROUP_LEFT: number = 1;
  export const GROUP_RIGHT: number = 2;
  export const GROUP_ENTER: number = 3;
  export const GROUP_KANA: number = 97;
}
export abstract class CaseSelector implements AbstractKeyData {
  lower: AbstractKeyData;
  upper: AbstractKeyData;
  compute(evaluator: ComputingEvaluator): KeyData {
    return (if (evaluator.state.isUppercase) { upper } else { lower }).compute(evaluator)
  }

  asString(isForDisplay: Boolean): String {
    return ""
  }
}

