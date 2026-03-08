import ShopDetailViewModel from '../../../../../viewmodel/ShopDetailViewModel'

/**
 *底部合计价格 组件
 */
@Component
export struct BottomTotalComponent {
  @Consume detailViewModel: ShopDetailViewModel

  build() {
    Row() {
      Row() {
        Image($r('app.media.icon_person'))
          .width(50)
          .height(60)

        Row() {
          Text($r('app.string.money_flag'))
            .fontSize(22)
            .fontColor($r('app.color.white'))

          Text(this.detailViewModel.totalPrice.toString())
            .id('main_detail_price')
            .fontSize(22)
            .fontColor($r('app.color.white'))
        }
        .margin({ left: 10, right: 10 })

        Line()
          .width(1)
          .height(15)
          .backgroundColor($r('app.color.gray_d'))
          .margin({ right: 10 })
        Text($r('app.string.prev_text'))
          .fontSize(12)
          .fontColor($r('app.color.gray3'))
      }

      Text() {
        Span($r('app.string.money_flag'))
        Span($r('app.string.money_text'))
      }
      .fontSize(18)
      .fontColor($r('app.color.gray3'))
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('90%')
    .height(60)
    .margin({ bottom: 10 })
    .padding({ left: 20, right: 20 })
    .backgroundColor($r('app.color.black'))
    .opacity(0.9)
    .borderRadius('50%')
  }
}