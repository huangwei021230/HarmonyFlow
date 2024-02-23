/**
 * Project-specific locale class wrapping java.util.Locale. The wrapping is
 * necessary to provide consistent language display names and tags across the
 * whole code base.
 *
 * This class would be ideal for Kotlin's value classes, though AndroidX.Room
 * does not like this at all, so this is a "normal" class.
 *
 * To construct a FlorisLocale, use one of the many from() methods provided.
 *
 * @see java.util.Locale
 */


class FlorisLocale {
  private base: Locale;

  private static readonly DELIMITER_LANGUAGE_TAG: string = '-';
  private static readonly DELIMITER_LOCALE_TAG: string = '_';
  private static readonly DELIMITER_SPLITTER: RegExp = /[ -_]/;

  private constructor(base: Locale) {
    this.base = base;
  }

  /**
   * Wraps a java.util.Locale and returns the FlorisLocale.
   *
   * @return The wrapped locale.
   */
  public static from(javaLocale: Locale): FlorisLocale {
    return new FlorisLocale(javaLocale);
  }

  /**
   * Constructs a new FlorisLocale with given language.
   *
   * @param language A two-letter language code.
   *
   * @return A new FlorisLocale.
   */
  public static from(language: string): FlorisLocale {
    return FlorisLocale.from(new Locale(language));
  }

  /**
   * Constructs a new FlorisLocale with given language and country.
   *
   * @param language A two-letter language code.
   * @param country A two-letter country code.
   *
   * @return A new FlorisLocale.
   */
  public static from(language: string, country: string): FlorisLocale {
    return FlorisLocale.from(new Locale(language, country));
  }

  /**
   * Constructs a new FlorisLocale with given language, country, and variant.
   *
   * @param language A two-letter language code.
   * @param country A two-letter country code.
   * @param variant A two-letter variant code.
   *
   * @return A new FlorisLocale.
   */
  public static from(language: string, country: string, variant: string): FlorisLocale {
    return FlorisLocale.from(new Locale(language, country, variant));
  }

  /**
   * Constructs a new FlorisLocale from given string.
   *
   * @param str Either a language or locale tag in string form.
   *
   * @return A new FlorisLocale.
   */
  public static fromTag(str: string): FlorisLocale {
    if (str.match(FLorisLocale.DELIMITER_SPLITTER)) {
      const lc: string[] = str.split(FLorisLocale.DELIMITER_SPLITTER);
      if (lc.length >= 3) {
        return FlorisLocale.from(lc[0], lc[1], lc[2]);
      } else {
        return FlorisLocale.from(lc[0], lc[1]);
      }
    } else {
      return FlorisLocale.from(str);
    }
  }

  /**
   * Gets the current value of the default locale for this instance of
   * the Java Virtual Machine.
   *
   * @see java.util.Locale.getDefault
   */
  public static default(): FlorisLocale {
    return FlorisLocale.from(Locale.getDefault());
  }

  /**
   * Returns a list of all installed locales.
   *
   * @see java.util.Locale.getAvailableLocales
   */
  public static installedSystemLocales(): FlorisLocale[] {
    return Locale.getAvailableLocales().map((locale: Locale) => FlorisLocale.from(locale));
  }

  /**
   * Returns a list of all installed locales and custom locales.
   */
  public static extendedAvailableLocales(context: Context): FlorisLocale[] {
    const systemLocales: FlorisLocale[] = FlorisLocale.installedSystemLocales();
    const extensionManager: ExtensionManager = context.extensionManager();
    const systemLocalesSet: Set<string> = new Set(systemLocales.map((locale: FlorisLocale) => locale.localeTag()));
    const extraLocales: Set<string> = new Set();
    for (const languagePackExtension of extensionManager.languagePacks.value ?? []) {
      for (const languagePackItem of languagePackExtension.items) {
        const locale: FlorisLocale = languagePackItem.locale;
        if (FlorisLocale.from(locale.language, locale.country).localeTag() in systemLocalesSet) {
          extraLocales.add(locale.localeTag());
        }
      }
    }
    return systemLocales.concat(Array.from(extraLocales).map((tag: string) => FlorisLocale.fromTag(tag)));
  }

  /**
   * Builds a locale or language tag for this locale by using delimiter.
   *
   * @param delimiter The delimiter to use between the components.
   *
   * @return The generated tag for this locale. May be an empty string if
   *  language, country, and variant are not specified.
   */
  private buildLocaleString(delimiter: string): string {
    const language: string = this.base.language;
    const country: string = this.base.country;
    const variant: string = this.base.variant;
    let result: string = language;
    if (language !== '' && country !== '') {
      result += delimiter;
    }
    result += country;
    if (country !== '' && variant !== '') {
      result += delimiter;
    }
    result += variant;
    return result;
  }

  /**
   * Returns the language code of this locale.
   *
   * @see java.util.Locale.getLanguage
   */
  get language(): string {
    return this.base.language;
  }

  /**
   * Returns the country/region code for this locale.
   *
   * @see java.util.Locale.getCountry
   */
  get country(): string {
    return this.base.country;
  }

  /**
   * Returns the variant code for this locale.
   *
   * @see java.util.Locale.getVariant
   */
  get variant(): string {
    return this.base.variant;
  }

  /**
   * Returns a three-letter abbreviation of this locale's language.
   *
   * @see java.util.Locale.getISO3Language
   */
  get iso3Language(): string {
    return this.base.isO3Language;
  }

  /**
   * Returns a three-letter abbreviation of this locale's country.
   *
   * @see java.util.Locale.getISO3Country
   */
  get iso3Country(): string {
    return this.base.isO3Country;
  }

  /**
   * Returns true if this language has a capitalization concept, false otherwise.
   * TODO: this is absolutely not exhaustive and hard-coded, find solution based on ICU or system
   */
  get supportsCapitalization(): boolean {
    return ['zh', 'ko', 'th'].includes(this.language) ? false : true;
  }

  /**
   * Returns true if suggestions in this language should have spaces added after, false otherwise.
   * TODO: this is absolutely not exhaustive and hard-coded, find solution based on ICU or system
   */
  get supportsAutoSpace(): boolean {
    return ['zh', 'ko', 'jp', 'th'].includes(this.language) ? false : true;
  }

  /**
   * Generates the language tag for this locale in the format xx,
   * xx-YY or xx-YY-zzz and returns it as a string.
   *
   * xx: Two-letter language code
   * YY: Two-letter country code
   * zzz: Three letter variant
   *
   * @return The language tag for this locale. May be an empty string if
   *  language, country, and variant are not specified.
   */
  public languageTag(): string {
    return this.buildLocaleString(FlorisLocale.DELIMITER_LANGUAGE_TAG);
  }

  /**
   * Generates the locale tag for this locale in the format xx,
   * xx_YY or xx_YY_zzz and returns it as a string.
   *
   * xx: Two-letter language code
   * YY: Two-letter country code
   * zzz: Three letter variant
   *
   * @return The locale tag for this locale. May be an empty string if
   *  language, country, and variant are not specified.
   */
  public localeTag(): string {
    return this.buildLocaleString(FlorisLocale.DELIMITER_LOCALE_TAG);
  }

  /**
   * Returns the name of this locale's language, localized to locale.
   *
   * @see java.util.Locale.getDisplayLanguage
   */
  public displayLanguage(locale: FlorisLocale = FlorisLocale.default()): string {
    return this.base.getDisplayLanguage(locale.base).titlecase(locale);
  }

  /**
   * Returns the name of this locale's country, localized to locale.
   *
   * @see java.util.Locale.getDisplayCountry
   */
  public displayCountry(locale: FlorisLocale = FlorisLocale.default()): string {
    return this.base.getDisplayCountry(locale.base);
  }

  /**
   * Returns a name for the locale's variant code that is appropriate for
   * display to the user.
   *
   * @see java.util.Locale.getDisplayVariant
   */
  public displayVariant(locale: FlorisLocale = FlorisLocale.default()): string {
    return this.base.getDisplayVariant(locale.base);
  }

  /**
   * Returns the display name for this locale, localized to locale in
   * the format Language, Language (Country) or Language (Country) [VARIANT].
   *
   * @param locale The locale to use for generating the display name for
   *  this locale, or default if otherwise.
   *
   * @return The display name for this locale. May be an empty string if
   *  language, country, and variant are not specified.
   */
  public displayName(locale: FlorisLocale = FlorisLocale.default()): string {
    let languageName: string = this.displayLanguage(locale);
    languageName = languageName === '' ? this.base.language : languageName;
    let countryName: string = this.displayCountry(locale);
    countryName = countryName === '' ? this.base.country : countryName;
    let variantName: string = this.displayVariant(locale);
    variantName = variantName === '' ? this.base.variant : variantName;
    let result: string = languageName;
    if (countryName !== '') {
      result += ` (${countryName})`;
    }
    if (variantName !== '') {
      result += ` [${variantName.toUpperCase()}]`;
    }
    return result;
  }

  /**
   * Generate a debug string representing this locale. Not to be confused
   * with java.util.Locale.toString, which produces a locale tag. If such
   * tag is needed, use localeTag.
   *
   * @return The debug representation of this locale.
   */
  public toString(): string {
    return `FlorisLocale { l=${this.base.language} c=${this.base.country} v=${this.base.variant} }`;
  }

  /**
   * Equality check for this locale.
   */
  public equals(other: any): boolean {
    if (this === other) return true;
    if (!(other instanceof FlorisLocale)) return false;
    return this.base.equals(other.base);
  }

  /**
   * Returns the hash code for this locale.
   */
  public hashCode(): number {
    return this.base.hashCode();
  }

  /**
   * The JSON (de)serializer for FlorisLocale.
   */
  public static Serializer: KSerializer<FlorisLocale> = {
    descriptor: PrimitiveSerialDescriptor("FlorisLocale", PrimitiveKind.STRING),

    serialize(encoder: Encoder, value: FlorisLocale): void {
      encoder.encodeString(value.languageTag());
    },

    deserialize(decoder: Decoder): FlorisLocale {
      return FlorisLocale.fromTag(decoder.decodeString());
    }
  };
}
