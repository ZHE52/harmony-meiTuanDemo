/**
 * 商品价格组件
 */
@Component
export struct PriceRowComponent {
  @Prop price: number
  @Prop pricePoint: string

  build() {
    Row() {
      Row() {
        Text($r('app.string.money_flag'))
          .fontSize(12)
          .fontColor($r('app.color.red'))

        Text(this.price.toString())
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.red'))

        if (this.pricePoint) {
          Text(this.pricePoint)
            .fontSize(12)
            .fontColor($r('app.color.red'))
        } else {
          Text($r('app.string.money_start'))
            .fontSize(12)
            .fontColor($r('app.color.red'))
        }
      }

      Text($r('app.string.select_size'))
        .fontColor($r('app.color.normal_text'))
        .fontSize(12)
        .backgroundColor($r('app.color.text_under'))
        .borderRadius(8)
        .padding(5)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}