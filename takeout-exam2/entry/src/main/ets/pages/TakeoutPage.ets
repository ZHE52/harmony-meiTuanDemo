import { TakeoutComponent } from '../view/home/takeout/TakeoutComponent'


/**
 * 首页点击 外卖后进入的外卖界面
 */
@Entry
@Component
struct TakeoutPage {
  @Consume pathStack: NavPathStack

  @Builder
  builderNavTitle() {
    Row() {
      Image($r('app.media.icon_arrow_left'))
        .width(24).height(24)
        .margin({ left: 10, right: 10 })
        .onClick(() => {
          this.pathStack.pop()
        })
        .id('main_take_back')
      Text($r('app.string.takeout_text'))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.normal_text'))
    }
    .justifyContent(FlexAlign.Start)
    .padding({ top: 10 })
  }

  build() {
    NavDestination() {
      TakeoutComponent()
    }
    .backgroundColor($r('app.color.gray_bg'))
    .title(this.builderNavTitle(), {
      backgroundColor: $r('app.color.main_theme'),
    })
    .hideBackButton(true)
  }
}

@Builder
export function TakeoutPageBuilder() {
  TakeoutPage()
}