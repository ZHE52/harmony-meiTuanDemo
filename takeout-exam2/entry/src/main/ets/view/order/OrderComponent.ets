@Component
export struct OrderComponent {
  build() {
    Column() {
      Text('这个是订单页面')
        .fontSize(20)
        .fontColor($r('app.color.black'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}