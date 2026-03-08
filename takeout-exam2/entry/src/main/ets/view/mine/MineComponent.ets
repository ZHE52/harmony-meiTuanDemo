@Component
export struct MineComponent {
  build() {
    Column() {
      Text('这个是我的页面')
        .fontSize(20)
        .fontColor($r('app.color.black'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}