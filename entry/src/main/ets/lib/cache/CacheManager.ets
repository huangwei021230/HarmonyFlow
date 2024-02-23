import * as fs from '@ohos.file.fs';
// import * as path from '';
// import * as os from '@ohos';
import * as util from '@ohos.util';

const readFileAsync = util.promisify(fs.readFile);
const writeFileAsync = util.promisify(fs.writeFile);
const readdirAsync = util.promisify(fs.readdir);
const statAsync = util.promisify(fs.stat);
const mkdirAsync = util.promisify(fs.mkdir);
const unlinkAsync = util.promisify(fs.unlink);
const rmdirAsync = util.promisify(fs.rmdir);

class CacheManager {
  static readonly InputDirName = 'input';
  static readonly OutputDirName = 'output';
  static readonly ImporterDirName = 'importer';
  static readonly ExporterDirName = 'exporter';
  static readonly EditorDirName = 'editor';
  static readonly BackupAndRestoreDirName = 'backup-and-restore';

  private appContext: any;
  private scope: any;
  readonly importer: WorkspacesContainer<ImporterWorkspace>;
  readonly exporter: WorkspacesContainer<ExporterWorkspace>;
  readonly themeExtEditor: WorkspacesContainer<ExtEditorWorkspace<ThemeExtensionEditor>>;
  readonly backupAndRestore: WorkspacesContainer<BackupAndRestoreWorkspace>;

  constructor(context: any) {
    this.appContext = context.appContext;
    this.scope = new SupervisorJob() + Dispatchers.Default;
    this.importer = new WorkspacesContainer<ImporterWorkspace>(CacheManager.ImporterDirName, (uuid) => new ImporterWorkspace(uuid));
    this.exporter = new WorkspacesContainer<ExporterWorkspace>(CacheManager.ExporterDirName, (uuid) => new ExporterWorkspace(uuid));
    this.themeExtEditor = new WorkspacesContainer<ExtEditorWorkspace<ThemeExtensionEditor>>(CacheManager.EditorDirName, (uuid) => new ExtEditorWorkspace<ThemeExtensionEditor>(uuid));
    this.backupAndRestore = new WorkspacesContainer<BackupAndRestoreWorkspace>(CacheManager.BackupAndRestoreDirName, (uuid) => new BackupAndRestoreWorkspace(uuid));
  }

  async readFromUriIntoCache(uriList: Uri[]): Promise<ImporterWorkspace> {
    const contentResolver = this.appContext.contentResolver;
    if (!contentResolver) {
      throw new Error("Content resolver is null.");
    }
    const workspace = this.importer.new(UUID.randomUUID().toString());
    workspace.inputFileInfos = [];
    for (const uri of uriList) {
      const cursor = await contentResolver.query(uri);
      if (!cursor) {
        throw new Error("Unable to fetch info about one or more resources to be imported.");
      }
      cursor.moveToFirst();
      const nameIndex = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
      const sizeIndex = cursor.getColumnIndex(OpenableColumns.SIZE);
      const fileName = cursor.getString(nameIndex);
      const size = cursor.getLong(sizeIndex);
      const file = new File(workspace.inputDir, fileName);
      await contentResolver.readToFile(uri, file);
      const extWorkingDir = workspace.outputDir.subDir(file.nameWithoutExtension);
      await ZipUtils.unzip(file, extWorkingDir);
      const extJsonFile = extWorkingDir.subFile(ExtensionDefaults.MANIFEST_FILE_NAME);
      const ext = await extJsonFile.readJson<Extension>(ExtensionJsonConfig);
      const info = new FileInfo(file, FileRegistry.guessMediaType(file, contentResolver.getType(uri)), size, ext);
      workspace.inputFileInfos.push(info);
    }
    this.importer.add(workspace);
    return workspace;
  }

  class WorkspacesContainer<T extends Workspace> {
  readonly dirName: string;
  readonly factory: (uuid: string) => T;
  private workspacesGuard: Mutex;
  private workspaces: T[];

  constructor(dirName: string, factory: (uuid: string) => T) {
    this.dirName = dirName;
    this.factory = factory;
    this.workspacesGuard = new Mutex(false);
    this.workspaces = [];
  }

  async new(uuid: string = UUID.randomUUID().toString()): Promise<T> {
    const workspace = this.factory(uuid);
    await workspace.mkdirs();
    this.add(workspace);
    return workspace;
  }

  private async add(workspace: T): Promise<void> {
    await this.workspacesGuard.withLock(() => {
      this.workspaces.push(workspace);
    });
  }

  async remove(workspace: T): Promise<void> {
    await this.workspacesGuard.withLock(() => {
      const index = this.workspaces.indexOf(workspace);
      if (index !== -1) {
        this.workspaces.splice(index, 1);
      }
    });
  }

  async getWorkspaceByUuid(uuid: string): Promise<T | null> {
    return await this.getWorkspaceByUuidAsync(uuid);
  }

  async getWorkspaceByUuidAsync(uuid: string): Promise<T | null> {
    return await this.workspacesGuard.withLock(() => {
      return this.workspaces.find(workspace => workspace.uuid === uuid) || null;
    });
  }
}

abstract class Workspace {
  readonly uuid: string;
  abstract readonly dir: string;

  constructor(uuid: string) {
    this.uuid = uuid;
  }

  async mkdirs(): Promise<void> {
    await mkdirAsync(this.dir, { recursive: true });
  }

  isOpen(): boolean {
    return fs.existsSync(this.dir);
  }

  isClosed(): boolean {
    return !fs.existsSync(this.dir);
  }

  close(): void {
    fs.rmSync(this.dir, { recursive: true });
  }
}

class ImporterWorkspace extends Workspace {
  readonly inputDir: string;
  readonly outputDir: string;
  inputFileInfos: FileInfo[];

  constructor(uuid: string) {
    super(uuid);
    this.inputDir = path.join(importer.dir, uuid, CacheManager.InputDirName);
    this.outputDir = path.join(importer.dir, uuid, CacheManager.OutputDirName);
    this.inputFileInfos = [];
  }

  async mkdirs(): Promise<void> {
    await super.mkdirs();
    await mkdirAsync(this.inputDir, { recursive: true });
    await mkdirAsync(this.outputDir, { recursive: true });
  }

  async close(): Promise<void> {
    await super.close();
    this.importer.remove(this);
  }
}

class ExporterWorkspace extends Workspace {
  constructor(uuid: string) {
    super(uuid);
  }
}

class ExtEditorWorkspace<T extends ExtensionEditor> extends Workspace {
  readonly extDir: string;
  readonly saverDir: string;
  currentAction: EditorAction | null;
  ext: Extension | null;
  editor: T | null;
  version: number;

  constructor(uuid: string) {
    super(uuid);
    this.extDir = path.join(themeExtEditor.dir, uuid, 'ext');
    this.saverDir = path.join(themeExtEditor.dir, uuid, 'saver');
    this.currentAction = null;
    this.ext = null;
    this.editor = null;
    this.version = 0;
  }

  async mkdirs(): Promise<void> {
    await super.mkdirs();
    await mkdirAsync(this.extDir, { recursive: true });
    await mkdirAsync(this.saverDir, { recursive: true });
  }

  update<R>(block: () => R): R {
    const ret = block();
    this.editor = this.editor;
    this.version++;
    return ret;
  }
}

class BackupAndRestoreWorkspace extends Workspace {
  readonly inputDir: string;
  readonly outputDir: string;
  zipFile: string;
  metadata: Backup.Metadata;
  restoreWarningId: number | null;
  restoreErrorId: number | null;

  constructor(uuid: string) {
    super(uuid);
    this.inputDir = path.join(backupAndRestore.dir, uuid, CacheManager.InputDirName);
    this.outputDir = path.join(backupAndRestore.dir, uuid, CacheManager.OutputDirName);
    this.zipFile = '';
    this.metadata = new Backup.Metadata();
    this.restoreWarningId = null;
    this.restoreErrorId = null;
  }

  async mkdirs(): Promise<void> {
    await super.mkdirs();
    await mkdirAsync(this.inputDir, { recursive: true });
    await mkdirAsync(this.outputDir, { recursive: true });
  }

  async close(): Promise<void> {
    await super.close();
    this.backupAndRestore.remove(this);
  }
}

class FileInfo {
  readonly file: string;
  readonly mediaType: string | null;
  readonly size: number;
  readonly ext: Extension | null;
  skipReason: number;

  constructor(file: string, mediaType: string | null, size: number, ext: Extension | null) {
    this.file = file;
    this.mediaType = mediaType;
    this.size = size;
    this.ext = ext;
    this.skipReason = NATIVE_NULLPTR.toInt();
  }
}
}
