import { TakeoutGoodsModel } from '../../../model/TakeoutGoodsModel'
import TakeoutViewModel from '../../../viewmodel/TakeoutViewModel'

/**
 * 外卖界面中间的神抢手部分组件
 */
@Component
export struct MiddleComponent {
  @Consume takeoutViewModel: TakeoutViewModel

  build() {
    Column() {
      //神抢手单行
      Row() {
        Image($r('app.media.mt_sqs'))
          .height(40).aspectRatio(5)
          .borderRadius({
            topLeft: 10,
            topRight: 10
          })
        Row() {
          Text($r('app.string.more_text'))
            .fontSize(13)
          Image($r('app.media.icon_arrow_right'))
            .width(15).height(15)
            .margin({ left: 4, right: 5 })
        }
      }
      .borderRadius({
        topLeft: 10,
        topRight: 10
      })
      .width('100%')
      .backgroundColor($r('app.color.white'))

      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        ForEach(this.takeoutViewModel.middleData, (item: TakeoutGoodsModel, index: number) => {
          GridItem() {
            Row() {
              Image($r('app.media.' + item.uri))
                .width('40%')
                .aspectRatio(1)
                .borderRadius(10)
                .margin({ right: 5 })
              Column() {
                Text(item.title)
                  .maxLines(2)
                  .fontSize(13)
                  .fontWeight(FontWeight.Bold)
                  .fontColor($r('app.color.normal_text'))
                Text(item.subTitle)
                  .fontSize(12)
                  .fontColor($r('app.color.white'))
                  .backgroundColor($r('app.color.pink'))
                  .padding({
                    left: 10,
                    right: 10,
                    top: 1,
                    bottom: 1
                  })
                  .borderRadius('50%')
                  .margin({ top: 5, bottom: 5 })
                Row() {
                  Text() {
                    Span('¥')
                      .fontSize(13)
                      .fontColor($r('app.color.pink'))
                    Span(item.price.toString())
                      .fontColor($r('app.color.pink'))
                      .fontSize(15)
                      .fontWeight(FontWeight.Bold)
                    Span('¥' + item.primaryPrice)
                      .fontSize(12)
                      .fontColor($r('app.color.gray_text'))
                      .fontWeight(FontWeight.Bold)
                      .decoration({
                        type: TextDecorationType.LineThrough,
                      })
                  }
                }
              }
              .layoutWeight(1)
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(HorizontalAlign.Start)
            }

          }.width('50%')

        }, (item: TakeoutGoodsModel) => JSON.stringify(item))
      }
      .padding(10)
      .width('100%')
    }
    .backgroundColor($r('app.color.white'))
    .borderRadius(10)
    .margin({ top: 10 })
  }
}