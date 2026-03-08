import { GridListComponent } from './GridListComponent';
import { GoodsListComponent } from './GoodsListComponent';

@Component
export struct HomeComponent {
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          GridListComponent()
          GoodsListComponent()
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