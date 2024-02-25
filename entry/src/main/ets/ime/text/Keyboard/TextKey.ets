import { ComputingEvaluator } from '../../keyboard/ComputingEvaluator'
import { Key } from '../../keyboard/Key'
import { KeyboardMode } from '../../keyboard/KeyboardMode'
import { AbstractKeyData, KeyData } from '../../keyboard/KeyData'
import { TextKeyData } from './TextKeyData'

export class TextKey extends Key{
  data: AbstractKeyData = null
  computedData: KeyData = TextKeyData.UNSPECIFIED
  computedSymbolHint: KeyData | null
  computedNumberHint: KeyData | null
  computedHintData: KeyData = TextKeyData.UNSPECIFIED

  computedDataOnDown: KeyData = TextKeyData.UNSPECIFIED
  constructor(data: AbstractKeyData) {
    super(data)
    this.data = data
  }
  compute(evaluator: ComputingEvaluator){
    let keyboard = evaluator.keyboard
    let keyboardMode = keyboard
    let computed = this.data.compute(evaluator)

    if(computed == null || !evaluator.evaluateVisible(computed)){
      this.computedData = TextKeyData.UNSPECIFIED
      super.isEnabled = false
      super.isVisible = false
    }else{
      this.computedData = computed


      if(keyboardMode == KeyboardMode.CHARACTERS || keyboardMode == KeyboardMode.NUMERIC_ADVANCED || keyboardMode == KeyboardMode.SYMBOLS || keyboardMode == KeyboardMode.SYMBOLS2){
        let computedLabel = computed.label.toLowerCase()
        let extLabel: string;
        switch (computed.groupId) {
          case KeyData.GROUP_ENTER:
            extLabel = "~enter";
            break;
          case KeyData.GROUP_LEFT:
            extLabel = "~left";
            break;
          case KeyData.GROUP_RIGHT:
            extLabel = "~right";
            break;
          case KeyData.GROUP_KANA:
            extLabel = "~kana";
            break;
          default:
            extLabel = computedLabel;
            break;
        }
      }
    }
  }

  // function setPressed(state: boolean, blockIfChanged: () => void): void {
  //   if (this.isPressed !== state) {
  //     this.isPressed = state;
  //     blockIfChanged();
  //   }
  // }

  addComputedHints(

  )

}