/**
 * Enum for the key hint modes.
 */
export enum KeyHintMode {
  DISABLED,
  HINT_PRIORITY,
  ACCENT_PRIORITY,
  SMART_PRIORITY
}
class KeyHintComponent{
  key: KeyHintMode
  label: string
  description: string
  showDescriptionOnlyIfSelected: boolean
}
export namespace KeyHintMode {
  export function listEntries(): KeyHintComponent[] {
    return [
      {
        key: KeyHintMode.ACCENT_PRIORITY,
        label: "Accent Priority",
        description: "Description for Accent Priority",
        showDescriptionOnlyIfSelected: true
      },
      {
        key: KeyHintMode.HINT_PRIORITY,
        label: "Hint Priority",
        description: "Description for Hint Priority",
        showDescriptionOnlyIfSelected: true
      },
      {
        key: KeyHintMode.SMART_PRIORITY,
        label: "Smart Priority",
        description: "Description for Smart Priority",
        showDescriptionOnlyIfSelected: true
      }
    ];
  }
}
