import { Key } from './Key'
import { KeyboardMode } from './KeyboardMode'

abstract class Keyboard{
  abstract mode: KeyboardMode
  abstract getKeyForPos(pointerX: number, pointerY: number):Key | null
  abstract keys(): Iterator<Key>
  abstract layout(
    keyboardWidth: number,
    keyboardHeight: number,
    desiredKey: Key,
    extendTouchBoundariesDownwards: Boolean,
  )
}

// TODO: TextKeys