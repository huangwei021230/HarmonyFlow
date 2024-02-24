import dataPreferences from '@ohos.data.preferences';
import { BusinessError } from '@ohos.base';
import { AppTheme } from '../ServiceExtAbility/ServiceExtAbility';
import { IncognitoMode } from '../ime/keyboard/IncognitoMode';
import { SwipeAction } from '../ime/text/gestures/SwipeAction';

let preferences: dataPreferences.Preferences | null = null;

class AppPrefs{

  constructor(context: Context) {
    try {
      dataPreferences.getPreferences(context, 'myStore', (err: BusinessError, val: dataPreferences.Preferences) => {
        if (err) {
          console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
          return;
        }
        preferences = val;
        console.info("App Prefs => Succeeded in getting preferences.");
      })
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error("Failed to get preferences. code =" + code + ", message =" + message);
    }
    this.init()
  }
  init(){
      try{
        // Advanced
        preferences.put("advanced__settings_theme", AppTheme.AUTO)
        preferences.put("advanced__settings_language", "auto")
        preferences.put("advanced__show_app_icon", true)
        preferences.put("advanced__incognito_mode", IncognitoMode.DYNAMIC_ON_OFF)
        preferences.put("advanced__force_incognito_mode_from_dynamic", false)

        // clipboard
        preferences.put("clipboard__use_internal_clipboard", false);
        preferences.put("clipboard__sync_to_floris", true);
        preferences.put("clipboard__sync_to_system", false);
        preferences.put("clipboard__history_enabled", false);
        preferences.put("clipboard__clean_up_old", false);
        preferences.put("clipboard__clean_up_after", 20);
        preferences.put("clipboard__limit_history_size", true);
        preferences.put("clipboard__max_history_size", 20);
        preferences.put("clipboard__clear_primary_clip_deletes_last_item", true);

        // correction
        preferences.put("correction__auto_capitalization", true);
        preferences.put("correction__auto_space_punctuation", false);
        preferences.put("correction__double_space_period", true);
        preferences.put("correction__remember_caps_lock_state", false);


        // devtools
        preferences.put("devtools__enabled", false);
        preferences.put("devtools__show_heap_memory_stats", false);
        preferences.put("devtools__show_primary_clip", false);
        preferences.put("devtools__show_input_state_overlay", false);
        preferences.put("devtools__show_spelling_overlay", false);
        preferences.put("devtools__show_touch_boundaries", false);
        preferences.put("devtools__show_drag_and_drop_helpers", false);

        // dictionary
        preferences.put("suggestion__enable_system_user_dictionary", true);
        preferences.put("suggestion__enable_floris_user_dictionary", true);


        // gestures
        preferences.put("gestures__swipe_up", SwipeAction.SHIFT);
        preferences.put("gestures__swipe_down", SwipeAction.HIDE_KEYBOARD);
        preferences.put("gestures__swipe_left", SwipeAction.SWITCH_TO_NEXT_SUBTYPE);
        preferences.put("gestures__swipe_right", SwipeAction.SWITCH_TO_PREV_SUBTYPE);
        preferences.put("gestures__space_bar_swipe_up", SwipeAction.NO_ACTION);
        preferences.put("gestures__space_bar_swipe_left", SwipeAction.MOVE_CURSOR_LEFT);
        preferences.put("gestures__space_bar_swipe_right", SwipeAction.MOVE_CURSOR_RIGHT);
        preferences.put("gestures__space_bar_long_press", SwipeAction.SHOW_INPUT_METHOD_PICKER);
        preferences.put("gestures__delete_key_swipe_left", SwipeAction.DELETE_CHARACTERS_PRECISELY);
        preferences.put("gestures__delete_key_long_press", SwipeAction.DELETE_CHARACTER);
        preferences.put("gestures__swipe_distance_threshold", 32);
        preferences.put("gestures__swipe_velocity_threshold", 1900);

        // glide
        preferences.put("glide__enabled", false);
        preferences.put("glide__show_trail", true);
        preferences.put("glide__trail_fade_duration", 200);
        preferences.put("glide__show_preview", true);
        preferences.put("glide__preview_refresh_delay", 150);
        preferences.put("glide__immediate_backspace_deletes_word", true);

        // inputFeedback
        preferences.put("input_feedback__audio_enabled", true);
        preferences.put("input_feedback__audio_activation_mode", InputFeedbackActivationMode.RESPECT_SYSTEM_SETTINGS);
        preferences.put("input_feedback__audio_volume", 50);
        preferences.put("input_feedback__audio_feat_key_press", true);
        preferences.put("input_feedback__audio_feat_key_long_press", false);
        preferences.put("input_feedback__audio_feat_key_repeated_action", false);
        preferences.put("input_feedback__audio_feat_gesture_swipe", false);
        preferences.put("input_feedback__audio_feat_gesture_moving_swipe", false);

        preferences.put("input_feedback__haptic_enabled", true);
        // preferences.put("input_feedback__haptic_activation_mode", InputFeedbackActivationMode.RESPECT_SYSTEM_SETTINGS);
        // preferences.put("input_feedback__haptic_vibration_mode", HapticVibrationMode.USE_VIBRATOR_DIRECTLY);
        preferences.put("input_feedback__haptic_vibration_duration", 50);
        preferences.put("input_feedback__haptic_vibration_strength", 50);
        preferences.put("input_feedback__haptic_feat_key_press", true);
        preferences.put("input_feedback__haptic_feat_key_long_press", false);
        preferences.put("input_feedback__haptic_feat_key_repeated_action", true);
        preferences.put("input_feedback__haptic_feat_gesture_swipe", false);
        preferences.put("input_feedback__haptic_feat_gesture_moving_swipe", true);


        // internal
        preferences.put("internal__home_is_beta_toolbox_collapsed_040a01", false);
        preferences.put("internal__is_ime_set_up", false);
        // preferences.put("internal__version_on_install", VersionName.DEFAULT_RAW);
        // preferences.put("internal__version_last_use", VersionName.DEFAULT_RAW);
        // preferences.put("internal__version_last_changelog", VersionName.DEFAULT_RAW);


        // keyboard
        preferences.put("keyboard__number_row", false);
        preferences.put("keyboard__hinted_number_row_enabled", true);
        // preferences.put("keyboard__hinted_number_row_mode", KeyHintMode.SMART_PRIORITY);
        // preferences.put("keyboard__hinted_symbols_enabled", true);
        // preferences.put("keyboard__hinted_symbols_mode", KeyHintMode.SMART_PRIORITY);
        // preferences.put("keyboard__utility_key_enabled", true);
        // preferences.put("keyboard__utility_key_action", UtilityKeyAction.DYNAMIC_SWITCH_LANGUAGE_EMOJIS);
        // preferences.put("keyboard__space_bar_display_mode", SpaceBarMode.CURRENT_LANGUAGE);
        // preferences.put("keyboard__capitalization_behavior", CapitalizationBehavior.CAPSLOCK_BY_DOUBLE_TAP);
        // preferences.put("keyboard__font_size_multiplier_portrait", 100);
        // preferences.put("keyboard__font_size_multiplier_landscape", 100);
        // preferences.put("keyboard__one_handed_mode", OneHandedMode.OFF);
        // preferences.put("keyboard__one_handed_mode_scale_factor", 87);
        // preferences.put("keyboard__landscape_input_ui_mode", LandscapeInputUiMode.DYNAMICALLY_SHOW);
        preferences.put("keyboard__height_factor_portrait", 100);
        preferences.put("keyboard__height_factor_landscape", 100);
        preferences.put("keyboard__key_spacing_vertical", 5.0);
        preferences.put("keyboard__key_spacing_horizontal", 2.0);
        preferences.put("keyboard__bottom_offset_portrait", 0);
        preferences.put("keyboard__bottom_offset_landscape", 0);
        preferences.put("keyboard__popup_enabled", true);
        preferences.put("keyboard__merge_hint_popups_enabled", false);
        preferences.put("keyboard__long_press_delay", 300);
        preferences.put("keyboard__space_bar_switches_to_characters", true);

        // localization
        // preferences.put("localization__display_language_names_in", DisplayLanguageNamesIn.SYSTEM_LOCALE)
        // preferences.put("localization__active_subtype_id", Subtype.DEFAULT.id)
        preferences.put("localization__subtypes", "[]")

        // media
        preferences.put("media__emoji_recently_used", EmojiRecentlyUsedHelper.Serializer.serialize(emojiRecentlyUsed))
        preferences.put("media__emoji_recently_used_max_size", 90)
        preferences.put("media__emoji_preferred_skin_tone", EmojiSkinTone.DEFAULT)
        preferences.put("media__emoji_preferred_hair_style", EmojiHairStyle.DEFAULT)


        // smartBar
        preferences.put("smartbar__enabled", true)
        // preferences.put("smartbar__layout", SmartbarLayout.SUGGESTIONS_ACTIONS_SHARED.name)
        // preferences.put("smartbar__action_arrangement", QuickActionArrangement.Serializer.serialize(actionArrangement))
        preferences.put("smartbar__flip_toggles", false)
        preferences.put("smartbar__shared_actions_expanded", false)
        preferences.put("smartbar__shared_actions_auto_expand_collapse", true)
        preferences.put("smartbar__shared_actions_expand_with_animation", true)
        preferences.put("smartbar__extended_actions_expanded", false)
        // preferences.put("smartbar__extended_actions_placement", ExtendedActionsPlacement.ABOVE_CANDIDATES.name)


        // spelling
        preferences.put("spelling__language_mode", SpellingLanguageMode.USE_KEYBOARD_SUBTYPES.name)
        preferences.put("spelling__use_contacts", true)
        preferences.put("spelling__use_udm_entries", true)


        // suggestion
        preferences.put("suggestion__api30_inline_suggestions_enabled", true)
        preferences.put("suggestion__enabled", false)
        preferences.put("suggestion__display_mode", CandidatesDisplayMode.DYNAMIC_SCROLLABLE.name)
        preferences.put("suggestion__block_possibly_offensive", true)
        preferences.put("suggestion__clipboard_content_enabled", true)
        preferences.put("suggestion__clipboard_content_timeout", 60)


        // theme
        // preferences.put("theme__mode", ThemeMode.FOLLOW_SYSTEM.name)
        // preferences.put("theme__day_theme_adapt_to_app", false)
        // preferences.put("theme__day_theme_id", ExtensionComponentName.Serializer.serialize(extCoreTheme("floris_day")))
        // preferences.put("theme__night_theme_adapt_to_app", false)
        // preferences.put("theme__night_theme_id", ExtensionComponentName.Serializer.serialize(extCoreTheme("floris_night")))
        // preferences.put("theme__editor_display_colors_as", DisplayColorsAs.HEX8.name)
        // preferences.put("theme__editor_display_kbd_after_dialogs", DisplayKbdAfterDialogs.REMEMBER.name)
        // preferences.put("theme__editor_level", SnyggLevel.ADVANCED.name)





      }catch (err){
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error("Failed to put value of 'startup'. code =" + code +", message =" + message);
      }
  }


}