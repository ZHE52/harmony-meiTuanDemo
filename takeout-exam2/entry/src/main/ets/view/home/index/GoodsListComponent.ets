import { HomeGoodsModel } from '../../../model/HomeGoodsModel'
import HomeViewModel from '../../../viewmodel/HomeViewModel'

/**
 * 首页外卖列表组件
 */
@Component
export struct GoodsListComponent {
  @Consume homeViewModel: HomeViewModel
  @Consume pathStack: NavPathStack

  /**
   * 渲染优惠活动
   * @param items
   */
  @Builder
  builderActivity(items: string[]) {
    Row() {
      ForEach(items, (item: string, index: number) => {
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

  /**
   * 渲染单元格图片
   * @param item
   */
  @Builder
  builderImage(item: HomeGoodsModel) {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.' + item.image))
        .width('100%')
        .aspectRatio(6 / 7)
        .borderRadius({ topLeft: 10, topRight: 10 })
      Row() {
        Text(item.type)
          .backgroundColor($r('app.color.text_bg_yellow'))
          .fontSize(11)
          .padding(5)
          .fontWeight(FontWeight.Bold)
        Text(item.time)
          .backgroundColor($r('app.color.text_bg_gray'))
          .fontSize(11)
          .padding(5)
          .fontColor($r('app.color.white'))
          .opacity(0.7)
      }
    }
  }

  build() {
    Flex({
      direction: FlexDirection.Row,
      wrap: FlexWrap.Wrap,
      alignItems: ItemAlign.Start,
      alignContent: FlexAlign.Start
    }) {
      ForEach(this.homeViewModel.getShopData(), (item: HomeGoodsModel, index: number) => {
        Column() {
          this.builderImage(item)
          Column() {
            Text(item.title)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .fontSize(14)
              .fontColor($r('app.color.normal_text'))
            Row() {
              Text(item.score)
                .fontSize(12)
                .fontColor($r('app.color.tabGray'))
              Column() {
              }
              .width(1).height(12)
              .backgroundColor($r('app.color.split_gray'))
              .margin({ left: 4, right: 4 })
              Text(item.turnover)
                .fontSize(12)
                .fontColor($r('app.color.tabGray'))
            }
            .margin({ top: 5, bottom: 5 })
            this.builderActivity(item.activity)
          }
          .padding(5)
          .alignItems(HorizontalAlign.Start)
        }
        .alignItems(HorizontalAlign.Start)
        .width('49%')
        .margin({
          top: 4,
          bottom: 4,
          right: index % 2 === 0 ? '2%' : 0
        })
        .borderRadius(10)
        .backgroundColor($r('app.color.white'))
        .id(`main_index_listitem_${index}`)
        .onClick(() => {
          this.homeViewModel.goDetail(item, this.pathStack)
        })
      }, (item: HomeGoodsModel) => JSON.stringify(item))
    }
    .margin({ left: 10, right: 10 })
  }
}