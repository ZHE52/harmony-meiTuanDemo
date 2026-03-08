import { GoodsTypeComponent } from './GoodsTypeComponent'
import { GoodsListComponent } from './GoodsListComponent'

/**
 * 点菜主界面组件
 */
@Component
export struct OrderDishesComponent {
  build() {
    Row() {
      //左侧 商品类型
      GoodsTypeComponent()
      //右侧 商品列表
      GoodsListComponent()
    }
    .height('100%')
    .width('100%')
  }
}