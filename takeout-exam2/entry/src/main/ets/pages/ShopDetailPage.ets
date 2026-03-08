import { ShopDetailComponent } from '../view/home/takeout/detail/ShopDetailComponent'
import { ShopModel } from '../model/ShopModel'

/**
 * 详情页 page
 */
@Entry
@Component
struct ShopDetailPage {
  @Consume pathStack: NavPathStack
  @Provide shopData: ShopModel = new ShopModel()

  build() {
    NavDestination() {
      if (this.shopData.title) {
        ShopDetailComponent({ shopData: this.shopData })
      }
      //
    }
    .backgroundColor($r('app.color.gray_bg'))
    .hideBackButton(true)
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      // 关键：在这里通过 context.pathInfo.param 获取参数
      this.shopData = context.pathInfo.param as ShopModel; // 接收参数

    })
  }
}

@Builder
export function ShopDetailPageBuilder() {
  ShopDetailPage()
}