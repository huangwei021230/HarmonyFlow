

/**
 * A simple helper class managing touch pointer objects. This class is designed to hold
 * at most 'capacity' pointers at once. It tries to reduce the need to recreate objects and to resize
 * arrays by creating a fixed-size list and by reusing pointers. This map supports iterating
 * over all active pointers.
 */
export class PointerMap<P extends Pointer> implements Iterable<P> {
  private pointers: P[];

  /**
   * Creates a new PointerMap with the specified capacity.
   * @param capacity The capacity of this map, determining the maximum number of pointers this
   * map can hold at once. This value must be greater than or equal to one. Should a smaller capacity
   * be passed, automatically the minimum capacity `1` is assumed.
   * @param init The initializer for each pointer. Note that [Pointer.reset] is called before
   * storing the new object, to ensure that this pointer is not initialized with some pointer data.
   */
  constructor(private capacity: number = 4, init: (index: number) => P) {
    this.pointers = new Array<P>(Math.max(1, capacity));
    for (let i = 0; i < this.pointers.length; i++) {
      this.pointers[i] = init(i);
      this.pointers[i].reset();
    }
  }

  /**
   * Adds a new pointer with given [id] and [index] and returns it. If this map is already at max
   * capacity, null is returned and the pointer could not be added.
   *
   * @param id The id of the pointer to add.
   * @param index The index of the pointer to add.
   *
   * @return The newly added pointer or null if the map is already full.
   */
  add(id: number, index: number): P | null {
    for (let pointer of this.pointers) {
      if (pointer.isNotUsed) {
        pointer.id = id;
        pointer.index = index;
        return pointer;
      }
    }
    return null;
  }

  /**
   * Clears this map and resets all pointers.
   */
  clear(): void {
    for (let pointer of this.pointers) {
      pointer.reset();
    }
  }

  /**
   * Finds a pointer by given [id].
   *
   * @param id The id of the pointer which should be found.
   *
   * @return The pointer with given [id] or null.
   */
  findById(id: number): P | null {
    for (let pointer of this.pointers) {
      if (pointer.id === id) {
        return pointer;
      }
    }
    return null;
  }

  /**
   * Gets a pointer from the internal array based on the internal array index. This method
   * is intended to be used only by the [PointerIterator].
   *
   * @param index
   *
   * @return The pointer for given index or null, excluding unused pointers.
   */
  private getPointer(index: number): P | null {
    const pointer = this.pointers[index];
    if (pointer != null && pointer.isUsed) {
      return pointer;
    }
    return null;
  }

  /**
   * Removes a pointer with given [id] and returns a boolean result.
   *
   * @param id The id of the pointer to remove. If the id is not existent, nothing happens.
   *
   * @return True if a pointer was removed, false otherwise.
   */
  removeById(id: number): boolean {
    for (let pointer of this.pointers) {
      if (pointer.id === id) {
        pointer.reset();
        return true;
      }
    }
    return false;
  }

  /**
   * Returns the size of this map (only counting active pointers). This value is anywhere
   * between 0 and [capacity].
   */
  get size(): number {
    let count = 0;
    for (let pointer of this.pointers) {
      if (pointer.isUsed) {
        count++;
      }
    }
    return count;
  }

  [Symbol.iterator](): Iterator<P> {
    return new PointerIterator(this);
  }
}

/**
 * An iterator for PointerMap.
 */
export class PointerIterator<P extends Pointer> implements Iterator<P> {
  private index: number = 0;

  constructor(private pointerMap: PointerMap<P>) {}

  /**
   * Checks if there are more elements to iterate over.
   * @returns True if there are more elements, otherwise false.
   */
  hasNext(): boolean {
    do {
      if (this.pointerMap.getPointer(this.index) != null) {
        return true;
      }
    } while (++this.index < this.pointerMap.capacity);
    return false;
  }

  /**
   * Returns the next element in the iteration.
   * @returns The next pointer.
   */
  next(): P {
    return this.pointerMap.getPointer(this.index++)!;
  }
}

/**
 * Abstract touch pointer definition.
 */
abstract class Pointer {
  static UNUSED_P: number = -1;

  id: number = Pointer.UNUSED_P;
  index: number = Pointer.UNUSED_P;

  /**
   * Returns true if this pointer is used and active, false otherwise.
   */
  get isUsed(): boolean {
    return this.id >= 0;
  }

  /**
   * Returns true if this pointer is not used and inactive, false otherwise.
   */
  get isNotUsed(): boolean {
    return !this.isUsed;
  }

  /**
   * Resets this pointer to be used again.
   */
  reset(): void {
    this.id = Pointer.UNUSED_P;
    this.index = Pointer.UNUSED_P;
  }
}
