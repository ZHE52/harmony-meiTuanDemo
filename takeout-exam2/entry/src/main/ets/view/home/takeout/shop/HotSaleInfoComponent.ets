import { ShopModel } from '../../../../model/ShopModel'

/**
 * 外卖界面店铺列表 热销信息 这一列组件
 */
@Component
export struct HotSaleInfoComponent {
  @Prop item: ShopModel

  build() {
    if (this.item.hotSales) {
      Column() {
        Row() {
          Image($r('app.media.icon_bd'))
            .width(14).height(14)
            .margin({ right: 5 })
          ForEach(this.item.hotSales, (item: string, index: number) => {
            Text(item)
              .fontSize(12)
              .fontColor($r('app.color.text_2'))
              .margin({ right: 5 })
          }, (item: string) => JSON.stringify(item))
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')

        if (this.item.salesInfo) {
          Text(this.item.salesInfo)
            .margin({ top: 5 })
            .fontSize(12).fontColor($r('app.color.normal_text'))

        }
      }
      .padding(5)
      .backgroundColor($r('app.color.text_bg2'))
      .borderRadius(5)
      .margin({ top: 5, bottom: 5 })
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
  }
}