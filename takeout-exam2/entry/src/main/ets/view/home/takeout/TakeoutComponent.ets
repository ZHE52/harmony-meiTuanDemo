import TakeoutViewModel from '../../../viewmodel/TakeoutViewModel'
import { SwiperGridComponent } from './SwiperGridComponent'
import { MiddleComponent } from './MiddleComponent'
import { ShopListComponent } from './ShopListComponent'

/**
 * 外卖页面组件
 */
@Component
export struct TakeoutComponent {
  @Provide takeoutViewModel: TakeoutViewModel = new TakeoutViewModel()
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          SwiperGridComponent()
          MiddleComponent()
          ShopListComponent()
        }
      }
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Vertical)
    }
    .backgroundColor($r('app.color.gray_bg'))
    .height('100%')
    .width('100%')
  }
}