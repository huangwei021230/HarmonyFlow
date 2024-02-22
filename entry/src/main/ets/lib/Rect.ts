import hash from '@ohos.file.hash';

export class Rect {
  public left: number;
  public top: number;
  public right: number;
  public bottom: number;

  constructor(left: number, top: number, right: number, bottom: number) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
  }

  public static empty(): Rect  {
    return new Rect(0.0, 0.0, 0.0, 0.0);
  }

  public static new(left: number = 0.0, top: number = 0.0, right: number = 0.0, bottom: number = 0.0): Rect {
    return new Rect(left, top, right, bottom);
  }

  public static from(r: Rect): Rect {
    return new Rect(r.left, r.top, r.right, r.bottom);
  }

  public applyFrom(other: Rect): Rect {
    this.left = other.left;
    this.top = other.top;
    this.right = other.right;
    this.bottom = other.bottom;
    return this;
  }

  public isEmpty(): boolean {
    return this.left >= this.right || this.top >= this.bottom;
  }

  public isNotEmpty(): boolean {
    return !this.isEmpty();
  }

  public intersectWith(other: Rect): void {
    this.left = Math.max(this.left, other.left);
    this.top = Math.max(this.top, other.top);
    this.right = Math.min(this.right, other.right);
    this.bottom = Math.min(this.bottom, other.bottom);
  }

  public intersectedWith(other: Rect): Rect {
    return new Rect(
      Math.max(this.left, other.left),
      Math.max(this.top, other.top),
      Math.min(this.right, other.right),
      Math.min(this.bottom, other.bottom)
    );
  }

  public overlaps(other: Rect): boolean {
    if (this.right <= other.left || other.right <= this.left) return false;
    if (this.bottom <= other.top || other.bottom <= this.top) return false;
    return true;
  }

  public contains(offset: { x: number; y: number }): boolean;
  public contains(offsetX: number, offsetY: number): boolean;
  public contains(arg1: { x: number; y: number } | number, arg2?: number): boolean {
    if (typeof arg1 === 'object') {
      // 处理包含 { x: number; y: number } 参数的逻辑
      return arg1.x >= this.left && arg1.x < this.right && arg1.y >= this.top && arg1.y < this.bottom;
    } else {
      // 处理独立的两个参数的逻辑
      const offsetX = arg1;
      const offsetY = arg2!;
      return offsetX >= this.left && offsetX < this.right && offsetY >= this.top && offsetY < this.bottom;
    }
  }


  set width(v: number) {
    this.right = this.left + v;
  }

  get width(): number {
    return this.right - this.left;
  }

  set height(v: number) {
    this.bottom = this.top + v;
  }

  get height(): number {
    return this.bottom - this.top;
  }

  get size(): { width: number; height: number } {
    return { width: this.width, height: this.height };
  }

  get minDimension(): number {
    return Math.min(Math.abs(this.width), Math.abs(this.height));
  }

  get maxDimension(): number {
    return Math.max(Math.abs(this.width), Math.abs(this.height));
  }

  public translateBy(offset: { x: number; y: number }): void;
  public translateBy(translateX: number, translateY: number): void;
  public translateBy(arg1: { x: number; y: number } | number, arg2?: number): void {
    if (typeof arg1 === 'object') {
      // 处理包含 { x: number; y: number } 参数的逻辑
      this.left += arg1.x;
      this.top += arg1.y;
      this.right += arg1.x;
      this.bottom += arg1.y;
    } else {
      // 处理独立的两个参数的逻辑
      const translateX = arg1;
      const translateY = arg2!;
      this.left += translateX;
      this.top += translateY;
      this.right += translateX;
      this.bottom += translateY;
    }
  }


  public translatedBy(offset: { x: number; y: number }): Rect;
  public translatedBy(translateX: number, translateY: number): Rect;
  public translatedBy(arg1: { x: number; y: number } | number, arg2?: number): Rect {
    if (typeof arg1 === 'object') {
      // 处理包含 { x: number; y: number } 参数的逻辑
      return new Rect(
        this.left + arg1.x,
        this.top + arg1.y,
        this.right + arg1.x,
        this.bottom + arg1.y
      );
    } else {
      // 处理独立的两个参数的逻辑
      const translateX = arg1;
      const translateY = arg2!;
      return new Rect(
        this.left + translateX,
        this.top + translateY,
        this.right + translateX,
        this.bottom + translateY
      );
    }
  }

  public inflateBy(delta: number): void;
  public inflateBy(deltaX: number, deltaY: number): void;
  public inflateBy(arg1: number, arg2?: number): void {
    if (typeof arg1 === 'number') {
      // 处理单个参数的逻辑
      this.left -= arg1;
      this.top -= arg1;
      this.right += arg1;
      this.bottom += arg1;
    } else {
      // 处理独立的两个参数的逻辑
      this.left -= arg1;
      this.top -= arg2!;
      this.right += arg1;
      this.bottom += arg2!;
    }
  }

  public inflatedBy(delta: number): Rect;
  public inflatedBy(deltaX: number, deltaY: number): Rect;
  public inflatedBy(arg1: number, arg2?: number): Rect {
    if (typeof arg1 === 'number') {
      // 处理单个参数的逻辑
      return new Rect(
        this.left - arg1,
        this.top - arg1,
        this.right + arg1,
        this.bottom + arg1
      );
    } else {
      // 处理独立的两个参数的逻辑
      return new Rect(
        this.left - arg1,
        this.top - arg2!,
        this.right + arg1,
        this.bottom + arg2!
      );
    }
  }


  public deflateBy(delta: number): void;
  public deflateBy(deltaX: number, deltaY: number): void;
  public deflateBy(arg1: number, arg2?: number): void {
    if (typeof arg1 === 'number') {
      // 处理单个参数的逻辑
      this.inflateBy(-arg1);
    } else {
      // 处理独立的两个参数的逻辑
      this.inflateBy(-arg1, -arg2!);
    }
  }

  public deflatedBy(delta: number): Rect;
  public deflatedBy(deltaX: number, deltaY: number): Rect;
  public deflatedBy(arg1: number, arg2?: number): Rect {
    if (typeof arg1 === 'number') {
      // 处理单个参数的逻辑
      return this.inflatedBy(-arg1);
    } else {
      // 处理独立的两个参数的逻辑
      return this.inflatedBy(-arg1, -arg2!);
    }
  }

  get topLeft(): { x: number; y: number } {
    return { x: this.left, y: this.top };
  }

  get topCenter(): { x: number; y: number } {
    return { x: this.left + this.width / 2.0, y: this.top };
  }

  get topRight(): { x: number; y: number } {
    return { x: this.right, y: this.top };
  }

  get centerLeft(): { x: number; y: number } {
    return { x: this.left, y: this.top + this.height / 2.0 };
  }

  get center(): { x: number; y: number } {
    return { x: this.left + this.width / 2.0, y: this.top + this.height / 2.0 };
  }

  get centerRight(): { x: number; y: number } {
    return { x: this.right, y: this.top + this.height / 2.0 };
  }

  get bottomLeft(): { x: number; y: number } {
    return { x: this.left, y: this.bottom };
  }

  get bottomCenter(): { x: number; y: number } {
    return { x: this.left + this.width / 2.0, y: this.bottom };
  }

  get bottomRight(): { x: number; y: number } {
    return { x: this.right, y: this.bottom };
  }

  public toAndroidRect(): { left: number; top: number; right: number; bottom: number } {
    return { left: Math.floor(this.left), top: Math.floor(this.top), right: Math.floor(this.right), bottom: Math.floor(this.bottom) };
  }

  public toString(): string {
    return `Rect(left = ${this.left}, top = ${this.top}, right = ${this.right}, bottom = ${this.bottom})`;
  }

  public equals(other: any): boolean {
    if (this === other) return true;
    if (this.constructor !== other?.constructor) return false;

    other = other as Rect;

    if (this.left !== other.left) return false;
    if (this.top !== other.top) return false;
    if (this.right !== other.right) return false;
    if (this.bottom !== other.bottom) return false;

    return true;
  }

  public hashCode(): number {
    // 使用 FNV-1a 哈希算法计算 hash code
    const hash = this.fnv1aHashObject({
      left: this.left,
      top: this.top,
      right: this.right,
      bottom: this.bottom,
    });

    return hash;
  }
  private fnv1aHashObject(obj: Record<string, any>): number {
    const fnvPrime = 16777619;
    let hash = 2166136261; // FNV-1a 初始值

    for (const value of Object.values(obj)) {
      // 处理每个属性值
      for (let i = 0; i < String(value).length; i++) {
        const char = String(value).charCodeAt(i);
        hash ^= char;
        hash *= fnvPrime;
        // 32 位有符号整数溢出处理
        hash |= 0;
      }
    }

    return hash;
  }
}

export function offsetToIntOffset(offset: { x: number; y: number }): { x: number; y: number } {
  return { x: Math.floor(offset.x), y: Math.floor(offset.y) };
}
