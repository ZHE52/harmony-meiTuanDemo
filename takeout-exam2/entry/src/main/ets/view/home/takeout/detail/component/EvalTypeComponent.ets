import { EvalTypeModel } from '../../../../../model/EvalTypeModel'
import ShopDetailViewModel from '../../../../../viewmodel/ShopDetailViewModel'

/**
 * 评价页面 评价类别 部分
 */
@Component
export struct EvalTypeComponent {
  @Consume detailViewModel: ShopDetailViewModel

  /**
   * 动态设置颜色
   * @param actColor 选中的颜色
   * @param normalColor 未选中颜色
   * @param index
   * @returns
   */
  setColor(actColor: Resource, normalColor: Resource, index: number): Resource {
    if (this.detailViewModel.evalTypeIndex == index) {
      return actColor
    } else {
      return normalColor
    }
  }

  build() {
    Column() {
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        alignItems: ItemAlign.Start,
        alignContent: FlexAlign.Start
      }) {
        ForEach(this.detailViewModel.evalTypeData, (item: EvalTypeModel, index: number) => {
          Text() {
            Span(item.name)
            Span('(')
            Span(item.count.toString())
            Span(')')
          }
          .margin({ bottom: 10, right: 10 })
          .borderRadius(3)
          .fontSize(12)
          .backgroundColor(this.setColor($r('app.color.text_bg'), $r('app.color.white'), index))
          .fontWeight(this.detailViewModel.evalTypeIndex == index ? FontWeight.Bold : FontWeight.Normal)
          .fontColor(this.setColor($r('app.color.text_color3'), $r('app.color.tabNormal'), index))
          .borderWidth(1)
          .borderColor(this.setColor($r('app.color.text_color3'), $r('app.color.gray_text'), index))
          .padding({
            top: 5,
            bottom: 5,
            left: 10,
            right: 10
          })
          .onClick(() => {
            this.detailViewModel.evalTypeChange(index)
          })
        }, (item: EvalTypeModel) => JSON.stringify(item))
      }
      .margin({ left: 10, right: 10 })
    }
    .padding({ left: 5, right: 5, top: 10 })
    .width('100%')
    .backgroundColor($r('app.color.white'))
  }
}