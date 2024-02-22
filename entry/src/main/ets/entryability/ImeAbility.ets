import InputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility';
import Want from '@ohos.app.ability.Want';
class InputMethodExt extends InputMethodExtensionAbility {
  onCreate(want: Want): void {
    console.log('onCreate, want:' + want.abilityName);
  }
  onDestroy(): void {
    console.log('onDestroy');
  }
}