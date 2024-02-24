// VersionName class
class VersionName {
  major: number;
  minor: number;
  patch: number;
  extraName?: string | null;
  extraValue?: number | null;

  constructor(
    major: number,
    minor: number,
    patch: number,
    extraName?: string | null,
    extraValue?: number | null
  ) {
    this.major = major;
    this.minor = minor;
    this.patch = patch;
    this.extraName = extraName;
    this.extraValue = extraValue;
  }

  static DEFAULT: VersionName = new VersionName(0, 0, 0);
  static DEFAULT_RAW: string = "0.0.0";

  static fromString(raw: string): VersionName | null {
    if (raw.match(/[0-9]+[.][0-9]+[.][0-9]+/)) {
      const list = raw.split(".").map((item) => parseInt(item));
      if (list.length === 3) {
        return new VersionName(list[0], list[1], list[2]);
      }
    } else if (raw.match(/[0-9]+[.][0-9]+[.][0-9]+[-][0-9]+/)) {
      const list = raw.split(".").map((item) => parseInt(item));
      if (list.length === 4) {
        return new VersionName(list[0], list[1], list[2], null, list[3]);
      }
    } else if (raw.match(/[0-9]+[.][0-9]+[.][0-9]+[-][a-zA-Z]+/)) {
      const list = raw.split(".");
      if (list.length === 4) {
        return new VersionName(
          parseInt(list[0]),
          parseInt(list[1]),
          parseInt(list[2]),
          list[3],
          null
        );
      }
    } else if (raw.match(/[0-9]+[.][0-9]+[.][0-9]+[-][a-zA-Z]+[0-9]+/)) {
      const list = raw.split(".");
      if (list.length === 4) {
        const extraName = list[3].match(/[a-zA-Z]+/)?.[0] || "";
        const extraValue = parseInt(list[3].match(/[0-9]+/)?.[0] || "");
        return new VersionName(
          parseInt(list[0]),
          parseInt(list[1]),
          parseInt(list[2]),
          extraName,
          extraValue
        );
      }
    }
    return null;
  }

  toString(): string {
    const mmp = `${this.major}.${this.minor}.${this.patch}`;
    if (this.extraName || this.extraValue !== null) {
      const extraName = this.extraName || "";
      const extraValue = this.extraValue !== null ? this.extraValue.toString() : "";
      return `${mmp}.${extraName}${extraValue}`;
    } else {
      return mmp;
    }
  }

  compareTo(other: VersionName): number {
    if (this.major !== other.major) {
      return this.major - other.major;
    } else if (this.minor !== other.minor) {
      return this.minor - other.minor;
    } else if (this.patch !== other.patch) {
      return this.patch - other.patch;
    } else if (this.extraValue !== null && other.extraValue !== null) {
      if (this.extraValue !== other.extraValue) {
        return this.extraValue - other.extraValue;
      }
    }
    return 0;
  }
}

// AppVersionUtils class
class AppVersionUtils {
  static getRawVersionName(context: any): string {
    try {
      return context.packageManager.getPackageInfo(context.packageName, 0).versionName;
    } catch (e) {
      return "undefined";
    }
  }

  static shouldShowChangelog(context: any, prefs: any): boolean {
    const installVersion = VersionName.fromString(prefs.internal.versionOnInstall.get()) || VersionName.DEFAULT;
    const lastChangelogVersion = VersionName.fromString(prefs.internal.versionLastChangelog.get()) || VersionName.DEFAULT;
    const currentVersion = VersionName.fromString(this.getRawVersionName(context)) || VersionName.DEFAULT;
    return lastChangelogVersion.compareTo(currentVersion) < 0 && installVersion.toString() !== currentVersion.toString();
  }

  static updateVersionOnInstallAndLastUse(context: any, prefs: any): void {
    if (prefs.internal.versionOnInstall.get() === VersionName.DEFAULT_RAW) {
      prefs.internal.versionOnInstall.set(this.getRawVersionName(context));
    }
    prefs.internal.versionLastUse.set(this.getRawVersionName(context));
  }

  static updateVersionLastChangelog(context: any, prefs: any): void {
    prefs.internal.versionLastChangelog.set(this.getRawVersionName(context));
  }


}
