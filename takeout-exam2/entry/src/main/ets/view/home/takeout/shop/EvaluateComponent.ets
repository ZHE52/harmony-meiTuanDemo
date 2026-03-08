/**
 * 外卖界面店铺列表 评价信息 这一行组件
 */
@Component
export struct EvaluateComponent {
  @Prop item: Array<string>

  build() {
    if (this.item) {
      Row() {
        ForEach(this.item, (item: string, index: number) => {
          Text(item)
            .fontSize(12)
            .fontColor($r('app.color.text2'))
            .padding(3)
            .backgroundColor($r('app.color.bg2'))
            .margin({ right: 5 })
            .borderRadius(4)
        }, (item: string) => JSON.stringify(item))
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
    }

  }
}