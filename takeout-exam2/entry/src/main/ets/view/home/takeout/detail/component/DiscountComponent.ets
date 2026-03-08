/**
 * 折扣信息 组件
 */
@Component
export struct DiscoutComponent {
  @Prop items: Array<String>

  build() {
    Row() {
      ForEach(this.items, (item: string, index: number) => {
        Text(item)
          .fontColor($r('app.color.red'))
          .fontSize(10)
          .borderWidth(0.5)
          .borderColor($r('app.color.red'))
          .borderRadius(4)
          .padding({
            left: 3,
            right: 3,
            top: 2,
            bottom: 2
          })
          .margin({ right: 4 })
      }, (item: string) => item)
    }
  }
}