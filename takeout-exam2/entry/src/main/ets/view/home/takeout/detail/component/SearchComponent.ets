/**
 * tab标题栏 右侧的搜索组件
 */
@Component
export struct SearchComponent {
  build() {
    Row() {
      Image($r('app.media.icon_search'))
        .width(15).height(15)
        .margin({ right: 5 })
      Text($r('app.string.search_text2'))
        .fontSize(11)
    }
    .padding({
      top: 6,
      bottom: 6,
      left: 8,
      right: 8,
    })
    .borderRadius('50%')
    .backgroundColor($r('app.color.gray_bg2'))
    .margin({ right: 10 })
  }
}