@Component
export struct MessageComponent {
  build() {
    Column() {
      Text('这个是消息页面')
        .fontSize(20)
        .fontColor($r('app.color.black'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

/**
 * 自定义导航顶部的标题
 * @param title
 */
@Builder
export function NavigationTitle(title: string | Resource) {
  Text(title)
    .fontSize(22) // 自定义字体大小
    .fontColor($r('app.color.white')) // 自定义字体颜色
    .fontWeight(FontWeight.Bold) // 自定义字体粗细
    .padding({ left: 20, top: 10 })
    .width('100%')
    .textAlign(TextAlign.Center)
}