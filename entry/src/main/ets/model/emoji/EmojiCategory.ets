export enum EmojiCategory {
  RECENTLY_USED = "recently_used",
  SMILEYS_EMOTION = "smileys_emotion",
  PEOPLE_BODY = "people_body",
  ANIMALS_NATURE = "animals_nature",
  FOOD_DRINK = "food_drink",
  TRAVEL_PLACES = "travel_places",
  ACTIVITIES = "activities",
  OBJECTS = "objects",
  SYMBOLS = "symbols",
  FLAGS = "flags"
}

export function iconId(category: EmojiCategory): number {
  switch (category) {
    case EmojiCategory.RECENTLY_USED:
      return 0; // Placeholder value, replace with actual icon ID
    case EmojiCategory.SMILEYS_EMOTION:
      return 1; // Placeholder value, replace with actual icon ID
    case EmojiCategory.PEOPLE_BODY:
      return 2; // Placeholder value, replace with actual icon ID
    case EmojiCategory.ANIMALS_NATURE:
      return 3; // Placeholder value, replace with actual icon ID
    case EmojiCategory.FOOD_DRINK:
      return 4; // Placeholder value, replace with actual icon ID
    case EmojiCategory.TRAVEL_PLACES:
      return 5; // Placeholder value, replace with actual icon ID
    case EmojiCategory.ACTIVITIES:
      return 6; // Placeholder value, replace with actual icon ID
    case EmojiCategory.OBJECTS:
      return 7; // Placeholder value, replace with actual icon ID
    case EmojiCategory.SYMBOLS:
      return 8; // Placeholder value, replace with actual icon ID
    case EmojiCategory.FLAGS:
      return 9; // Placeholder value, replace with actual icon ID
    default:
      throw new Error("Unknown EmojiCategory");
  }
}
