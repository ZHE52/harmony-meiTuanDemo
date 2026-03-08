import { ShopModel } from '../../../../model/ShopModel'

/**
 * 外卖界面店铺列表 配送信息 这一列组件
 */
@Component
export struct DeliveryInfoComponent {
  @Prop item: ShopModel

  @Builder
  builderText(text: string | Resource, marginRight?: number) {
    Text(text)
      .fontSize(12)
      .fontColor($r('app.color.tabGray'))
      .margin({ right: marginRight })
  }

  build() {
    if (this.item.startPrice) {
      Row() {
        Row() {
          this.builderText($r('app.string.start_text'))
          this.builderText(this.item.startPrice + '', 5)
          if (this.item.extraPrice == '0') {
            this.builderText($r('app.string.deliv_free'))
          } else {
            this.builderText($r('app.string.deliv_text'))
            this.builderText(this.item.extraPrice + '')
          }

        }

        Row() {
          this.builderText(this.item.sendTime + '', 5)
          this.builderText(this.item.sendDistance + '')
        }
      }
      .margin({ top: 5, bottom: 5 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}