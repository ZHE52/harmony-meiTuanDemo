import { NavTitleComponent } from './component/NavTitleComponent'
import { TopCardComponent } from './component/TopCardComponent'
import { ShopModel } from '../../../../model/ShopModel'
import ShopDetailViewModel from '../../../../viewmodel/ShopDetailViewModel'
import { TabTitleComponent } from './component/TabTitleComponent'
import { SearchComponent } from './component/SearchComponent'
import { OrderDishesComponent } from './OrderDishesComponent'
import { EvaluateMainComponent } from './EvaluateMainComponent'
import { ComboComponent } from './ComboComponent'
import { BottomTotalComponent } from './component/BottomTotalComponent'

@Component
export struct ShopDetailComponent {
  @Provide detailViewModel: ShopDetailViewModel = new ShopDetailViewModel();
  @Prop shopData: ShopModel

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Stack({ alignContent: Alignment.TopStart }) {
          //顶部的背景图和 半透明层
          NavTitleComponent()
          //顶部的店铺信息卡片
          TopCardComponent({ shopData: this.shopData })
        }

        //点菜、套餐、评价 tab标题栏
        Row() {
          Row() {
            TabTitleComponent({ text: $r('app.string.tab_book'), index: 0 })
            TabTitleComponent({ text: $r('app.string.tab_combo'), index: 1 })
            TabTitleComponent({ text: $r('app.string.tab_eval'), index: 2 })
          }
          .layoutWeight(1)

          SearchComponent()
        }
        .margin({ top: 5 })
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .justifyContent(FlexAlign.Start)

        Tabs({ barPosition: BarPosition.Start, controller: this.detailViewModel.tabController }) {
          TabContent() {
            //点菜
            OrderDishesComponent()
          }

          TabContent() {
            //套餐
            ComboComponent()
          }

          TabContent() {
            //评价
            EvaluateMainComponent()
          }
        }
        .scrollable(false)
        .barHeight(0)
        .barMode(BarMode.Scrollable)
        .barPosition(BarPosition.Start)
        .layoutWeight(1)

      }
      .backgroundColor($r('app.color.white'))

      //底部的合计价格组件
      BottomTotalComponent()
    }

  }
}