import { ShopModel } from '../../../../../model/ShopModel'

/**
 * 评价页面 分数部分
 */
@Component
export struct EvalScoreComponent {
  @Consume shopData: ShopModel
  @State score: string = ''

  aboutToAppear(): void {
    this.score = this.shopData.score.split('分')[0]
  }

  @Builder
  builderText(text: string | Resource) {
    Text(text)
      .fontSize(12)
      .fontColor($r('app.color.normal_text'))
  }

  @Builder
  builderStar() {
    Row() {
      ForEach([0, 0, 0, 0, 0], (item: number, index: number) => {
        Image($r('app.media.icon_star'))
          .width(14).height(14)
          .margin({ left: 2, right: 2, bottom: 2 })
      }, (item: string) => item)
    }
    .alignItems(VerticalAlign.Center)
    .margin({ left: 5, right: 5 })
  }

  @Builder
  builderOneRow(text: Resource) {
    Row() {
      this.builderText(text)
      this.builderStar()
      Text(this.score)
        .fontSize(16)
        .fontColor($r('app.color.text_bg_yellow'))
        .padding({ bottom: -3 })
    }
    .alignItems(VerticalAlign.Bottom)
    .padding({ top: 5, bottom: 5 })
  }

  build() {
    Row() {
      Column() {
        Text(this.score)
          .fontColor($r('app.color.text_bg_yellow'))
          .fontSize(28)
        this.builderText($r('app.string.text_evel_score'))
      }.padding(10)

      Column() {
        this.builderOneRow($r('app.string.text_taste'))
        this.builderOneRow($r('app.string.text_package'))

      }

      Line()
        .width(1)
        .height(40)
        .backgroundColor($r('app.color.gray3'))
      Column() {
        Text(this.score)
          .fontColor($r('app.color.gray_text2'))
          .fontSize(24)
        Text($r('app.string.text_deliv'))
          .fontSize(12)
          .fontColor($r('app.color.gray_text2'))
      }
      .padding(10)
    }
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor($r('app.color.white'))
    .width('100%')
    .margin({ top: 10, bottom: 10 })
  }
}