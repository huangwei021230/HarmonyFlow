import * as fs from 'fs';

/**
 * Type alias for a file system directory.
 */
type FsDir = fs.Dir;

/**
 * Type alias for a file system file.
 */
type FsFile = fs.File;

/**
 * Helper function to get a subdirectory of a directory.
 * @param relPath The relative path of the subdirectory.
 * @returns The subdirectory.
 */
function subDir(dir: FsDir, relPath: string): FsDir {
  return fs.dir(dir, relPath);
}

/**
 * Helper function to get a subfile of a directory.
 * @param relPath The relative path of the subfile.
 * @returns The subfile.
 */
function subFile(dir: FsDir, relPath: string): FsFile {
  return fs.file(dir, relPath);
}

/**
 * Function to delete all contents of a directory recursively.
 */
function deleteContentsRecursively(dir: FsDir): void {
  fs.rmdirSync(dir, { recursive: true });
}

/**
 * Function to read JSON data from a file.
 * @param file The file to read JSON data from.
 * @returns The parsed JSON data.
 */
function readJson<T>(file: FsFile): T {
  const text: string = fs.readFileSync(file, 'utf-8');
  return JSON.parse(text) as T;
}

/**
 * Function to write JSON data to a file.
 * @param file The file to write JSON data to.
 * @param data The JSON data to write.
 */
function writeJson<T>(file: FsFile, data: T): void {
  const text = JSON.stringify(data);
  fs.writeFileSync(file, text, 'utf-8');
}

/**
 * Getter to get the parent directory of a file or directory.
 * @returns The parent directory.
 */
function getParentDir(fileOrDir: FsFile | FsDir): FsDir | undefined {
  return fs.getParentDir(fileOrDir);
}
