/**
 * 头部背景图片
 */
@Component
export struct NavTitleComponent {
  build() {
    Stack() {
      Image($r('app.media.bg_nxdc'))
        .width('100%')
        .height(140)
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
        .objectFit(ImageFit.Cover)
      //背景图上面放一个半透明的蒙层
      Row() {

      }
      .width('100%')
      .backgroundColor($r('app.color.bg_trans'))
      .opacity(0.5)
      .height(140)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
    }

  }
}