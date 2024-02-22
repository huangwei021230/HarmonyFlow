import { KeyData } from '../keyboard/KeyData'

export interface InputKeyEventReceiver{
  /**
   * Event method which gets called when a key went down.
   *
   * @param data The associated input key data.
   */
  onInputKeyDown(data: KeyData)

  /**
   * Event method which gets called when a key went up.
   *
   * @param data The associated input key data.
   */
  onInputKeyUp(data: KeyData)

  /**
   * Event method which gets called when a key is called repeatedly while being pressed down.
   *
   * @param data The associated input key data.
   */
  onInputKeyRepeat(data: KeyData)

  /**
   * Event method which gets called when a key press is cancelled.
   *
   * @param data The associated input key data.
   */
  onInputKeyCancel(data: KeyData)
}