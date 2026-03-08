import ShopDetailViewModel from '../../../../viewmodel/ShopDetailViewModel'
import { ComboGoodsModel, ComboModel } from '../../../../model/ComboModel'
import { ComboGoodsItemComponent } from './component/ComboGoodsItemComponent'

/**
 * 套餐 主页面
 */
@Component
export struct ComboComponent {
  @Consume detailViewModel: ShopDetailViewModel

  /**
   * 渲染套餐名称一行
   * @param item
   */
  @Builder
  builderTitleRow(item: ComboModel) {
    Row() {
      Image($r('app.media.' + (item.comboType == '1' ? 'icon_rq' : 'icon_rx')))
        .width(20)
        .height(20)
        .margin({ left: 5 })
      Text(item.comboName)
        .fontSize(12)
        .fontColor($r('app.color.normal_text'))
    }
    .margin({ top: 10, bottom: 6 })
    .justifyContent(FlexAlign.Start)
    .width('100%')
  }

  /**
   * 渲染套餐商品
   * @param item
   */
  @Builder
  builderGoodsRow(item: ComboModel) {
    Row() {
      ForEach(item.comboGoods, (item: ComboGoodsModel, index2: number) => {
        //套餐 单个的商品信息
        ComboGoodsItemComponent({ comboGoods: item })
      }, (item: ComboGoodsModel) => JSON.stringify(item))
    }
    .width('100%')
  }

  /**
   * 渲染价格、立即购买 一行
   * @param item
   */
  @Builder
  builderPriceRow(item: ComboModel) {
    Row() {
      Text($r('app.string.goods_price'))
        .fontColor($r('app.color.normal_text'))
        .fontSize(13)
      Text() {
        Span($r('app.string.money_flag'))
          .fontSize(11)
        Span(item.price.toString())
          .fontSize(18)
      }
      .fontColor($r('app.color.red'))
      .margin({ left: 10, right: 10 })

      //立即购买 按钮
      Text($r('app.string.go_buy'))
        .fontColor($r('app.color.normal_text'))
        .fontSize(14)
        .backgroundColor($r('app.color.btn_yellow'))
        .padding({
          top: 8,
          bottom: 8,
          left: 15,
          right: 15
        })
        .borderRadius(4)
    }
    .justifyContent(FlexAlign.End)
    .width('100%')
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          ForEach(this.detailViewModel.comboData, (item: ComboModel, index: number) => {
            Column() {
              //套餐名称
              this.builderTitleRow(item)
              //套餐商品信息
              this.builderGoodsRow(item)
              //套餐价格
              this.builderPriceRow(item)
            }
            .margin({ bottom: 10 })
            .padding(10)
            .borderRadius(10)
            .width('100%')
            .backgroundColor($r('app.color.white'))
            .shadow({
              radius: 16,
              color: '#30000000',
              offsetX: 0,
              offsetY: 8
            })
          }, (item: Array<ComboModel>) => JSON.stringify(item))
        }
        .padding({ left: 10, right: 10 })
        .backgroundColor($r('app.color.gray_bg'))
        .width('100%')
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')

  }
}