import TakeoutViewModel from '../../../viewmodel/TakeoutViewModel'
import { ShopModel } from '../../../model/ShopModel'
import { ShopScoreComponent } from './shop/ShopScoreComponent'
import { DeliveryInfoComponent } from './shop/DeliveryInfoComponent'
import { HotSaleInfoComponent } from './shop/HotSaleInfoComponent'
import { EvaluateComponent } from './shop/EvaluateComponent'

/**
 * 外卖界面店铺列表组件
 */
@Component
export struct ShopListComponent {
  @Consume takeoutViewModel: TakeoutViewModel
  @Consume pathStack: NavPathStack

  build() {
    Column() {
      // TODO: 考点6 - 外卖页面商家列表实现
      // 功能要求：实现外卖页面的商家列表展示和点击跳转功能
      // 数据源：this.takeoutViewModel.shopListData（返回ShopModel数组）
      // 布局结构：
      // - 使用List组件作为列表容器
      //   - List组件参数设置：space设置为10（列表项间距），initialIndex设置为0（初始显示第一项）
      // - 在List内部，遍历商家数据数组，每一项渲染一个ListItem列表项
      //   - 遍历时需要设置keyGenerator函数，使用数据项的title属性作为唯一标识
      // - 每个ListItem需要设置以下属性：
      //   - 为ListItem绑定点击事件
      //   - id属性设置为`main_shop_listitem_${index}`（index为遍历的索引）
      // - ListItem内部包含一个Row横向布局容器，需要设置以下属性：
      //   - padding属性设置为10（内边距）
      //   - backgroundColor属性设置为应用颜色资源app.color.white（白色背景）
      //   - width属性设置为'100%'（宽度占满）
      //   - borderRadius属性设置为10（圆角）
      // - Row容器内部从左到右包含以下内容（已实现，无需修改）：
      //   - Image图片组件：显示商家图片
      //   - Column垂直布局容器：包含商家详细信息
      //     - Text文本组件：显示商家名称
      //     - ShopScoreComponent组件：显示商家评分信息
      //     - DeliveryInfoComponent组件：显示配送费用信息
      //     - HotSaleInfoComponent组件：显示热销信息
      //     - EvaluateComponent组件：显示评价信息
      // 交互功能：
      // - 为ListItem绑定点击事件
      // - 点击事件逻辑：调用this.takeoutViewModel.goDetail方法进行商家详情页面跳转，传入商家数据对象item和this.pathStack作为参数
      // 注意事项：
      // - 必须为ListItem绑定点击事件，不能为内部子组件绑定
      // - 必须正确设置ListItem的id属性，确保测试通过
      // - 内部的详细布局代码已实现，只需在正确位置调用即可
      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.takeoutViewModel.shopListData, (item: ShopModel, index: number) => {
          ListItem() {
            Row() {
              //左边的图片
              Image($r('app.media.' + item.image))
                .width('32%')
                .aspectRatio(1)
                .borderRadius(10)
                .margin({ right: 5 })
              Column() {
                //名称
                Text(item.title)
                  .fontSize(15).fontColor($r('app.color.normal_text'))
                  .fontWeight(FontWeight.Bold)
                //评分
                ShopScoreComponent({ item })
                //配送费用信息
                DeliveryInfoComponent({ item })
                //热销信息
                HotSaleInfoComponent({ item })
                //评价信息
                EvaluateComponent({ item: item.evaluateList })
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding(10)
            .backgroundColor($r('app.color.white'))
            .width('100%')
            .borderRadius(10)
          }
          .id(`main_shop_listitem_${index}`)
          .onClick(() => {
            this.takeoutViewModel.goDetail(item, this.pathStack)
          })
        }, (item: ShopModel) => item.title)
      }
    }
    .margin({ top: 10 })
    .padding({ left: 10, right: 10 })
    .width('100%')
  }
}