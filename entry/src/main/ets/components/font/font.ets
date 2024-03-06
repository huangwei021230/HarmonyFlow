// xxx.ets
import font from '@ohos.font';

@Entry
@Component
struct FontExample {
  @State message: string = 'Hello World'

  aboutToAppear() {
    // familySrc支持RawFile
    font.registerFont({
      familyName: 'emoji',
      familySrc: $rawfile('font/NotoColorEmoji-Regular.ttf')
    })
  }

  build() {
    Column() {
      Text(this.message)
        .align(Alignment.Center)
        .fontSize(20)
        .fontFamily('medium') // medium：注册自定义字体的名字（$r('app.string.mediumFamilyName')、'mediumRawFile'等已注册字体也能正常使用）
    }.width('100%')
  }
}
