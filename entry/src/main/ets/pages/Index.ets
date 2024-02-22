@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button('click me')
          .onClick(() => {
            this.message = 'ArkUI'

          })
          .height(50)
          .width(100)
      }

      .width('100%')
    }
    .height('100%')
  }
}