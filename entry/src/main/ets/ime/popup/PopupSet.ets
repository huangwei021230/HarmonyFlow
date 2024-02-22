/**
 * A fully configured collection of popup keys. It contains a list of keys to be prioritized
 * during rendering (ordered by relevance descending) by showing those keys close to the
 * popup spawning point.
 *
 * The keys contain a separate [hint] key to ease rendering the hint label, but the hint, if
 * present, also occurs in the [prioritized] list.
 *
 * The popup keys can be accessed like an array with the addition that negative indexes defined
 * within this companion object are allowed (as long as the corresponding [prioritized] list
 * contains the corresponding amount of keys.
 */
import { ComputingEvaluator } from '../keyboard/ComputingEvaluator';
import { AbstractKeyData } from '../keyboard/KeyData';
import { KeyHintConfiguration, KeyHintMode } from '../text/Key/KeyHintConfiguration';

export class PopupKeys<T> {
  hint: T | null;
  prioritized: T[];
  other: T[];

  constructor(hint: T | null, prioritized: T[], other: T[]) {
    this.hint = hint;
    this.prioritized = prioritized;
    this.other = other;
  }

  static FIRST_PRIORITIZED: number = -1;
  static SECOND_PRIORITIZED: number = -2;
  static THIRD_PRIORITIZED: number = -3;

  get size(): number {
    return this.prioritized.length + this.other.length;
  }

  contains(element: T): boolean {
    return this.prioritized.includes(element) || this.other.includes(element);
  }

  containsAll(elements: T[]): boolean {
    return elements.every(element => this.contains(element));
  }

  isEmpty(): boolean {
    return this.prioritized.length === 0 && this.other.length === 0;
  }

  [Symbol.iterator](): IterableIterator<T> {
    const allItems: T[] = [...this.prioritized, ...this.other];
    return allItems[Symbol.iterator]();
  }

  getOrNull(index: number): T | null {
    if (index >= this.other.length || index < -this.prioritized.length) {
      return null;
    }
    switch (index) {
      case PopupKeys.FIRST_PRIORITIZED:
        return this.prioritized[0];
      case PopupKeys.SECOND_PRIORITIZED:
        return this.prioritized[1];
      case PopupKeys.THIRD_PRIORITIZED:
        return this.prioritized[2];
      default:
        return this.other[index];
    }
  }

  get(index: number): T {
    const item = this.getOrNull(index);
    if (item === null) {
      throw new Error(`Specified index ${index} is not a valid entry in this PopupKeys!`);
    }
    return item;
  }
}

/**
 * A popup set for a single key. This set describes, if the key has a [main] character and other [relevant] popups.
 *
 * Note that a hint character cannot and should not be set in a json extended popup file, rather it
 * should only be dynamically set by the LayoutManager.
 *
 * The order in which these defined popups will be shown depends on the current [KeyHintConfiguration].
 */
export abstract class PopupSet<T extends AbstractKeyData> {
  main: T | null;
  relevant: T[];

  constructor(main: T | null = null, relevant: T[] = []) {
    this.main = main;
    this.relevant = relevant;
  }

  abstract getPopupKeys(keyHintConfiguration: KeyHintConfiguration): PopupKeys<T>;
}

/**
 * A mutable version of PopupSet.
 */
class MutablePopupSet<T extends AbstractKeyData> extends PopupSet<T> {
  declare main: T | null;
  declare relevant: T[];
  symbolHint: T | null;
  numberHint: T | null;
  symbolPopups: T[];
  numberPopups: T[];
  configCache: Map<KeyHintConfiguration, PopupKeys<T>>;

  constructor(
    main: T | null = null,
    relevant: T[] = [],
    symbolHint: T | null = null,
    numberHint: T | null = null,
    symbolPopups: T[] = [],
    numberPopups: T[] = [],
    configCache: Map<KeyHintConfiguration, PopupKeys<T>> = new Map()
  ) {
    super(main, relevant);
    this.symbolHint = symbolHint;
    this.numberHint = numberHint;
    this.symbolPopups = symbolPopups;
    this.numberPopups = numberPopups;
    this.configCache = configCache;
  }

  clear(): void {
    this.symbolHint = null;
    this.numberHint = null;
    this.main = null;
    this.relevant = [];
    this.symbolPopups = [];
    this.numberPopups = [];
    this.configCache.clear();
  }

  getPopupKeys(keyHintConfiguration: KeyHintConfiguration): PopupKeys<T> {
    return this.configCache.get(keyHintConfiguration) || this.initPopupList(keyHintConfiguration);
  }

  /**
   * Initializes the list of popup keys based on the specified key hint configuration.
   * @param keyHintConfiguration The key hint configuration to use.
   * @returns The initialized popup keys.
   */
  private initPopupList(keyHintConfiguration: KeyHintConfiguration): PopupKeys<T> {
    // Retrieve local copies of relevant properties
    const localMain = this.main;
    const localRelevant = this.relevant;
    const localSymbolHint = this.symbolHint;
    const localNumberHint = this.numberHint;

    // Check if symbol hint is enabled and available
    if (localSymbolHint !== null && keyHintConfiguration.symbolHintMode !== KeyHintMode.DISABLED) {
      // Check if number hint is enabled and available
      if (localNumberHint !== null && keyHintConfiguration.numberHintMode !== KeyHintMode.DISABLED) {
        // Determine whether to merge hint popups
        const hintPopups = keyHintConfiguration.mergeHintPopups ? [...this.symbolPopups, ...this.numberPopups] : [];
        // Choose popup keys based on symbol hint mode
        switch (keyHintConfiguration.symbolHintMode) {
          case KeyHintMode.ACCENT_PRIORITY:
            switch (keyHintConfiguration.numberHintMode) {
            // when both hints are present in accent priority, always have a non-hint key first if possible
              case KeyHintMode.ACCENT_PRIORITY:
                if (localMain !== null) {
                  return new PopupKeys<T>(localSymbolHint, [localMain, localSymbolHint, localNumberHint], localRelevant.concat(hintPopups));
                } else if (localRelevant.length > 0) {
                  return new PopupKeys<T>(localSymbolHint, [localRelevant[0], localSymbolHint, localNumberHint], localRelevant.slice(1).concat(hintPopups));
                } else {
                  return new PopupKeys<T>(localSymbolHint, [localSymbolHint, localNumberHint], hintPopups);
                }
            // hint priority of number hint wins and overrules accent priority of symbol hint
              case KeyHintMode.HINT_PRIORITY:
                return new PopupKeys<T>(localSymbolHint, [localNumberHint, localMain, localSymbolHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            // due to smart priority of number hint, main wins if it exists, otherwise number hint overrules accent priority of symbol hint
              default:
                return new PopupKeys<T>(localSymbolHint, [localMain, localNumberHint, localSymbolHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            }
          case KeyHintMode.HINT_PRIORITY:
            switch (keyHintConfiguration.symbolHintMode) {
            // when both hints are present in hint priority, symbol hint wins
              case KeyHintMode.HINT_PRIORITY:
                return new PopupKeys<T>(localSymbolHint, [localSymbolHint, localNumberHint, localMain].filter(x => x !== null), localRelevant.concat(hintPopups));
            // hint priority of symbol hint wins, and overrules potential accent priority of number hint
              default:
                return new PopupKeys<T>(localSymbolHint, [localSymbolHint, localMain, localNumberHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            }
          default:
            switch (keyHintConfiguration.numberHintMode) {
            // smart priority of symbol hint wins, and overrules accent priority of number hint
              case KeyHintMode.ACCENT_PRIORITY:
                return new PopupKeys<T>(localSymbolHint, [localMain, localSymbolHint, localNumberHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            // hint priority of number hint wins
              case KeyHintMode.HINT_PRIORITY:
                return new PopupKeys<T>(localSymbolHint, [localNumberHint, localMain, localSymbolHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            // when both hints are in smart priority, always have main first if possible
              default:
                return new PopupKeys<T>(localSymbolHint, [localMain, localSymbolHint, localNumberHint].filter(x => x !== null), localRelevant.concat(hintPopups));
            }
        }
      } else {
        // Determine whether to merge hint popups
        const hintPopups = keyHintConfiguration.mergeHintPopups ? this.symbolPopups : [];
        // Choose popup keys based on symbol hint mode
        switch (keyHintConfiguration.symbolHintMode) {
        // in accent priority, always show a non-hint key first if possible
          case KeyHintMode.ACCENT_PRIORITY:
            if (localMain !== null) {
              return new PopupKeys<T>(localSymbolHint, [localMain, localSymbolHint], localRelevant.concat(hintPopups));
            } else if (localRelevant.length > 0) {
              return new PopupKeys<T>(localSymbolHint, [localRelevant[0], localSymbolHint], localRelevant.slice(1).concat(hintPopups));
            } else {
              return new PopupKeys<T>(localSymbolHint, [localSymbolHint], hintPopups);
            }
        // in hint priority, always show hint first
          case KeyHintMode.HINT_PRIORITY:
            return new PopupKeys<T>(localSymbolHint, [localSymbolHint, localMain].filter(x => x !== null), localRelevant.concat(hintPopups));
        // in smart priority, show main first if possible
          default:
            return new PopupKeys<T>(localSymbolHint, [localMain, localSymbolHint].filter(x => x !== null), localRelevant.concat(hintPopups));
        }
      }
    } else if (localNumberHint !== null && keyHintConfiguration.numberHintMode !== KeyHintMode.DISABLED) {
      // Determine whether to merge hint popups
      const hintPopups = keyHintConfiguration.mergeHintPopups ? this.numberPopups : [];
      // Choose popup keys based on number hint mode
      switch (keyHintConfiguration.numberHintMode) {
      // in accent priority, always show a non-hint key first if possible
        case KeyHintMode.ACCENT_PRIORITY:
          if (localMain !== null) {
            return new PopupKeys<T>(localNumberHint, [localMain, localNumberHint], localRelevant.concat(hintPopups));
          } else if (localRelevant.length > 0) {
            return new PopupKeys<T>(localNumberHint, [localRelevant[0], localNumberHint], localRelevant.slice(1).concat(hintPopups));
          } else {
            return new PopupKeys<T>(localNumberHint, [localNumberHint], hintPopups);
          }
      // in hint priority, always show hint first
        case KeyHintMode.HINT_PRIORITY:
          return new PopupKeys<T>(localNumberHint, [localNumberHint, localMain].filter(x => x !== null), localRelevant.concat(hintPopups));
      // in smart priority, show main first if possible
        default:
          return new PopupKeys<T>(localNumberHint, [localMain, localNumberHint].filter(x => x !== null), localRelevant.concat(hintPopups));
      }
    } else {
      // if no hints shall be shown, use main first if possible
      return new PopupKeys<T>(null, [localMain].filter(x => x !== null), localRelevant);
    }
  }



  merge(other: PopupSet<AbstractKeyData>, evaluator: ComputingEvaluator): void {
    this.mergeInternal(other, evaluator, this.relevant, true);
  }

  mergeSymbolHint(hintPopups: PopupSet<AbstractKeyData>, evaluator: ComputingEvaluator): void {
    this.mergeInternal(hintPopups, evaluator, this.symbolPopups);
  }

  mergeNumberHint(hintPopups: PopupSet<AbstractKeyData>, evaluator: ComputingEvaluator): void {
    this.mergeInternal(hintPopups, evaluator, this.numberPopups);
  }

  private mergeInternal(other: PopupSet<AbstractKeyData>, evaluator: ComputingEvaluator, targetList: T[], useMain: boolean = false): void {
    other.relevant.forEach(it => {
      const data = it.compute(evaluator) as AbstractKeyData as T | null;
      if (data !== null) {
        targetList.push(data);
      }
    });
    if (other.main !== null) {
      const data = other.main.compute(evaluator) as AbstractKeyData as T | null;
      if (data !== null) {
        if (useMain && this.main === null) {
          this.main = data;
        } else {
          targetList.push(data);
        }
      }
    }
  }

}
