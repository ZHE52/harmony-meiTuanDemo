import { ShopModel } from '../../../../model/ShopModel'

/**
 * 外卖界面店铺列表 评分这一列组件
 */
@Component
export struct ShopScoreComponent {
  @Prop item: ShopModel

  /**
   * 渲染配送类型
   * @param type
   */
  @Builder
  builderDeliveryType(type: string) {
    if (type == '1') {
      Text($r('app.string.mtzs_text'))
        .fontSize(11)
        .fontColor($r('app.color.delivery_text'))
        .padding(3)
        .backgroundColor($r('app.color.text_bg1'))
        .borderRadius(4)
    } else {
      Text($r('app.string.mtks_text'))
        .fontSize(11)
        .padding(3)
        .fontColor($r('app.color.text2'))
        .borderWidth(0.5)
        .borderColor($r('app.color.text2'))
        .borderRadius(4)
    }
  }

  build() {
    if (this.item.score) {
      Row() {
        Row() {
          Text(this.item.score)
            .fontColor($r('app.color.score_color'))
            .fontWeight(FontWeight.Bold)
          Text(this.item.turnover)
            .fontSize(12)
            .fontColor($r('app.color.tabGray'))
            .margin({ left: 10, right: 10 })
          Text(this.item.avgPrice?.toString())
            .fontSize(12)
            .fontColor($r('app.color.tabGray'))
        }

        this.builderDeliveryType(this.item.deliveryType)
      }
      .margin({ top: 5, bottom: 5 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}