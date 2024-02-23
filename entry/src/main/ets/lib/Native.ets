
import util from '@ohos.util';

/**
 * Type alias for a native pointer.
 */
type NativePtr = number;

/**
 * Constant value for a native null pointer.
 */
const NATIVE_NULLPTR: NativePtr = 0;

/**
 * Type alias for a native string in standard UTF-8 encoding.
 */
type NativeStr = Uint8Array;

/**
 * Converts a native string to a JavaScript string.
 */
export function toJavaString(nativeStr: NativeStr): string {
  return new util.TextDecoder().decode(nativeStr);
}

/**
 * Converts a JavaScript string to a native string.
 */
export function toNativeStr(javaString: string): NativeStr {
  return new util.TextEncoder().encode(javaString);
}

/**
 * Interface for a native instance object. Defines the basic
 * methods which each native instance wrapper should define and be able
 * to handle to.
 */
interface NativeInstanceWrapper {
  /**
   * Returns the native pointer of this instance. The returned pointer
   * is only valid if dispose() has not been previously called.
   *
   * @return The native null pointer for this instance.
   */
  nativePtr(): NativePtr;

  /**
   * Deletes the native object and frees allocated resources. After
   * invoking this method one MUST NOT touch this instance ever again.
   */
  dispose(): void;
}
