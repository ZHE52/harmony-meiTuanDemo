import { TypeModel } from '../../../../model/TypeModel'
import ShopDetailViewModel from '../../../../viewmodel/ShopDetailViewModel'

/**
 * 点菜 左侧类型组件
 */
@Component
export struct GoodsTypeComponent {
  @Consume detailViewModel: ShopDetailViewModel

  build() {
    Column() {
      List({ space: 0, initialIndex: 0, scroller: this.detailViewModel.goodsTypeScroller }) {

        ForEach(this.detailViewModel.typeData, (item: TypeModel, index: number) => {
          ListItem() {
            Row() {
              if (item.image) {
                Image($r('app.media.' + item.image))
                  .width(20).height(20)
              }
              Text(item.title)
                .textAlign(TextAlign.Center)
                .fontSize(12)
                .fontColor(this.detailViewModel.typeIndex == index ? '#333' : '#666')
                .padding({ left: 10, right: 10 })
            }
            .padding({
              left: 10,
              right: 10,
              top: 15,
              bottom: 15
            })
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.detailViewModel.typeIndex == index ? $r('app.color.white') : $r('app.color.gray_bg2'))
            .width('100%')
            .onClick(() => {
              this.detailViewModel.typeChange(index)
            })
          }
          .id(`main_detail_type_${index}`)

        }, (item: TypeModel) => JSON.stringify(item))
        //底部添加一个空白的组件，避免底部价格挡住页面list
        ListItem() {

        }.height(80)
      }
      .width('25%')
      .scrollBar(BarState.Off)

    }
    .height('100%')

  }
}