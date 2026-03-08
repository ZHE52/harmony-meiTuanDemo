import ShopDetailViewModel from '../../../../viewmodel/ShopDetailViewModel'
import { ShopGoodsModel } from '../../../../model/ShopGoodsModel'
import { EvaluateComponent } from '../shop/EvaluateComponent'
import { PriceRowComponent } from './component/PriceRowComponent'

/**
 * 点菜页面右侧商品列表
 */
@Component
export struct GoodsListComponent {
  @Consume detailViewModel: ShopDetailViewModel

  /**
   * 渲染商品图片
   * @param item
   */
  @Builder
  builderImage(item: ShopGoodsModel) {
    Stack({ alignContent: Alignment.TopEnd }) {
      //左边的图片
      Image($r('app.media.' + item.image))
        .width('38%')
        .aspectRatio(1)
        .borderRadius(10)
        .margin({ right: 5 })
      if (item.type == '1') { //招牌
        Text($r('app.string.type1_text'))
          .fontSize(12)
          .fontColor($r('app.color.white'))
          .backgroundColor($r('app.color.text_under'))
          .padding(2)
          .margin({ top: -2 })
          .borderRadius(4)
      } else if (item.type == '2') { //新品
        Text($r('app.string.type2_text'))
          .fontSize(12)
          .fontColor($r('app.color.white'))
          .backgroundColor($r('app.color.bg_green'))
          .padding(2)
          .margin({ top: -2 })
          .borderRadius(4)
      }

    }

  }

  build() {
    List({
      space: 10,
      initialIndex: 0,
      scroller: this.detailViewModel.goodsListScroller
    }) {
      ForEach(this.detailViewModel.shopGoodsData, (item: ShopGoodsModel, index: number) => {
        ListItem() {
          Row() {
            this.builderImage(item)
            Column() {
              //名称
              Text(item.title)
                .fontSize(16).fontColor($r('app.color.normal_text'))
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 2 })
              //
              EvaluateComponent({ item: item.activity })
              //销量
              Text() {
                Span(item.turnover)
                Span(item.goodEval).margin({ left: 10 })
              }
              .margin({ top: 4, bottom: 2 })
              .fontSize(12).fontColor($r('app.color.gray_text'))

              //数量
              Text(item.quantity)
                .fontSize(12)
                .fontColor($r('app.color.normal_text'))
                .backgroundColor($r('app.color.gray_bg2'))
                .padding({
                  top: 2,
                  bottom: 2,
                  left: 4,
                  right: 4
                })
                .borderRadius(4)
                .margin({ top: 2, bottom: 2 })
              //价格
              PriceRowComponent({ price: item.price, pricePoint: item.pricePoint })

            }
            .width('60%')
            .alignItems(HorizontalAlign.Start)
          }
          .padding(10)
          .backgroundColor($r('app.color.white'))
          .width('100%')
          .borderRadius(10)
        }
        .id(`main_detail_listitem_${index}`)
        .onClick(() => {
          this.detailViewModel.calcTotalPrice(item)
        })
      }, (item: ShopGoodsModel) => item.title)

      ListItem() {
      }
      .height(80)
    }
    .scrollBar(BarState.Off)
    .layoutWeight(1)
    .onScrollIndex((start: number, end: number) => {
      this.detailViewModel.rightOnScroll(start)
    })
  }
}