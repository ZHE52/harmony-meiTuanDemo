import { HomeGridModel } from '../../../model/HomeGridModel'
import TakeoutViewModel from '../../../viewmodel/TakeoutViewModel'

/**
 * 外卖顶部的 宫格组件
 */
@Component
export struct SwiperGridComponent {
  @Consume pathStack: NavPathStack
  @Consume takeoutViewModel: TakeoutViewModel

  build() {
    Column() {
      // TODO: 考点5 - 外卖页面宫格轮播功能实现
      // 功能要求：实现外卖页面顶部的宫格图标轮播展示功能，支持分页显示
      // 数据源：this.takeoutViewModel.gridData（二维数组，外层数组代表轮播页，内层数组代表每页的宫格项）
      // 布局结构：
      // - 使用Swiper组件作为最外层容器，实现轮播功能
      //   - Swiper组件属性设置：autoPlay设置为false（不自动播放），loop设置为false（不循环），indicator设置为true（显示指示器）
      //   - Swiper组件的id属性设置为 'main_takeout_sw'
      // - 在Swiper内部，遍历this.takeoutViewModel.gridData外层数组，每一项渲染一个Grid宫格容器
      //   - Grid组件下边距为20
      // - 在Grid内部，遍历内层数组（每页的宫格数据），每一项渲染一个GridItem
      //   - GridItem宽度为'20%'（每行显示5个图标）
      // - GridItem内部包含一个Column垂直布局容器
      //   - Column容器的上下内边距均为10
      // - Column内部从上到下依次包含：
      //   - Image图片组件：显示宫格图标
      //     - 图片资源路径：应用资源 app.media.[数据项的uri属性]
      //     - 图片宽度40、高度40
      //   - Text文本组件：显示宫格标题
      //     - 文本内容：数据项的title属性
      //     - 文本上边距为5
      //     - 文本字体大小为13
      //     - 文本字体颜色：应用颜色资源 app.color.normal_text
      // 注意事项：
      // - 必须正确设置Swiper的id属性，确保测试通过
      // - 遍历时需要设置keyGenerator函数，将数据项转换为JSON字符串作为唯一标识
      // - 本组件为纯展示组件，不需要实现点击事件
      Swiper() {
        ForEach(this.takeoutViewModel.gridData, (pageData: Array<HomeGridModel>) => {
          Grid() {
            ForEach(pageData, (item: HomeGridModel) => {
              GridItem() {
                Column() {
                  Image($r(`app.media.${item.uri}`))
                    .width(40)
                    .height(40)
                  Text(item.title)
                    .margin({ top: 5 })
                    .fontSize(13)
                    .fontColor($r('app.color.normal_text'))
                }
                .padding({ top: 10, bottom: 10 })
              }
              .width('20%')
            }, (item: HomeGridModel) => JSON.stringify(item))
          }
          .margin({ bottom: 20 })
        }, (item: Array<HomeGridModel>) => JSON.stringify(item))
      }
      .autoPlay(false)
      .loop(false)
      .indicator(true)
      .id('main_takeout_sw')
    }
    .backgroundColor($r('app.color.gray_bg'))
  }
}