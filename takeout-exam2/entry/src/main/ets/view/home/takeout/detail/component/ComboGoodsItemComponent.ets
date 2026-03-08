import { ComboGoodsModel } from '../../../../../model/ComboModel'

/**
 * 套餐商品信息组件
 */
@Component
export struct ComboGoodsItemComponent {
  @Prop comboGoods: ComboGoodsModel

  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomStart }) {
        //商品图片
        Row() {
          Image($r('app.media.' + this.comboGoods.image))
            .width(60).height(60)
        }
        .borderRadius(5)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .backgroundColor($r('app.color.bg_f6'))
        .width('30%')
        .aspectRatio(1)
        .margin({ right: 8 })

        //价格
        Text() {
          Span($r('app.string.money_flag'))
          Span(this.comboGoods.price.toString())
        }
        .fontColor($r('app.color.white'))
        .fontSize(12)
        .backgroundColor($r('app.color.black'))
        .opacity(0.7)
        .padding({
          left: 4,
          right: 4,
          top: 2,
          bottom: 2
        })
        .borderRadius(2)
      }

      Text(this.comboGoods.name)
        .fontSize(12)
        .margin({ top: 5 })
    }
    .alignItems(HorizontalAlign.Start)
  }
}