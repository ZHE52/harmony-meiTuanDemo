import { HomeComponent } from '../view/home/index/HomeComponent'

import { MessageComponent } from '../view/message/MessageComponent'
import { OrderComponent } from '../view/order/OrderComponent'
import { MineComponent } from '../view/mine/MineComponent'
import { NavigationTitleComponent } from '../view/common/NavigationTitleComponent'
import HomeViewModel from '../viewmodel/HomeViewModel'

@Entry
@Component
struct Index {
  @Provide pathStack: NavPathStack = new NavPathStack()
  @Provide homeViewModel: HomeViewModel = new HomeViewModel()
  @State tabsIndex: number = 0
  private controller: TabsController = new TabsController()

  /**
   * 底部导航按钮渲染
   * @param index 序号
   * @param name 标题
   * @param icon  图标
   */
  @Builder//ui渲染
  tabBuilder(index: number, name: string | Resource, icon: string) {
    if (index == 0 && this.tabsIndex == 0) { //美团
      Image(this.tabsIndex == index ? $r('app.media.' + icon + '_sel') : $r('app.media.' + icon))
        .width(44)
        .aspectRatio(1)
        .objectFit(ImageFit.Contain)
        .onClick(() => {
          this.tabsIndex = index
          this.controller.changeIndex(index)
        })
    } else {
      this.buildNormalTabbar(index, name, icon)
    }

  }

  //渲染底部正常的 tabbar
  @Builder
  buildNormalTabbar(index: number, name: string | Resource, icon: string) {
    Column() {
      Image(this.tabsIndex == index ? $r('app.media.' + icon + '_sel') : $r('app.media.' + icon))
        .width(25)
        .aspectRatio(1)
        .objectFit(ImageFit.Contain)
      Text(name)
        .fontSize(12)
        .margin({ top: 3 })
        .fontColor(this.tabsIndex == index ? $r('app.color.tabNormal') : $r('app.color.tabGray'))
    }.alignItems(HorizontalAlign.Center)
    .backgroundColor($r('app.color.white'))
    .onClick(() => {
      this.tabsIndex = index
      this.controller.changeIndex(index)
    })
  }

  //自定义首页的 顶部导航栏
  @Builder
  builderNavTitle() {
    NavigationTitleComponent()
  }

  build() {
    Column() {
      Navigation(this.pathStack) {
        Column() {
          // TODO: 考点1 - 底部Tab导航切换功能实现
          // 功能要求：实现应用底部的Tab导航栏，支持4个页面切换
          // 布局结构：
          // - 使用Tabs组件作为Tab容器
          //   - Tabs组件参数设置：barPosition设置为BarPosition.End（Tab栏在底部），controller设置为this.controller（Tab控制器），index设置为this.tabsIndex（当前选中的Tab索引）
          //   - Tabs组件需要设置以下属性：
          //     - scrollable属性设置为false（禁止通过滑动切换Tab）
          //     - onChange属性：监听Tab切换事件，接收index参数表示切换后的Tab索引，更新this.tabsIndex和调用控制器切换Tab页
          // - 在Tabs内部，创建4个TabContent标签页内容，依次包含：
          //   - 第1个TabContent：内容为HomeComponent组件，tabBar设置为调用this.tabBuilder方法，传入索引0、应用文本资源app.string.tab_mt_text、图标名'tab_home'
          //   - 第2个TabContent：内容为MessageComponent组件，tabBar设置为调用this.tabBuilder方法，传入索引1、应用文本资源app.string.tab_message_text、图标名'tab_message'
          //   - 第3个TabContent：内容为OrderComponent组件，tabBar设置为调用this.tabBuilder方法，传入索引2、应用文本资源app.string.tab_order_text、图标名'tab_order'
          //   - 第4个TabContent：内容为MineComponent组件，tabBar设置为调用this.tabBuilder方法，传入索引3、应用文本资源app.string.tab_mine_text、图标名'tab_mine'
          // 交互功能：
          // - 监听Tab切换事件，更新当前选中的Tab索引
          // - 通过Tab控制器同步更新Tab显示状态
          // 注意事项：
          // - 必须禁止滑动切换Tab，只能通过点击底部Tab栏切换
          // - Tab索引从0开始，对应4个页面
          // - tabBuilder方法已实现，用于渲染底部Tab栏的图标和文字

          /**
           第一步，tabs都出来，然后把tabcontent写出来，包住具体的组件
           **/
          /**
           *  第二步
           */
          Tabs({barPosition:BarPosition.End,controller:this.controller ,index:this.tabsIndex}){
            TabContent(){
              HomeComponent()
            }
            .tabBar(this.tabBuilder(0, $r('app.string.tab_mt_text'), 'tab_home'))
            TabContent(){
              MessageComponent()
            }
            .tabBar(this.tabBuilder(1, $r('app.string.tab_message_text'), 'tab_message'))
            TabContent(){
              OrderComponent()
            }
            .tabBar(this.tabBuilder(2, $r('app.string.tab_order_text'), 'tab_order'))
            TabContent(){
              MineComponent()
            }.tabBar(this.tabBuilder(3, $r('app.string.tab_mine_text'), 'tab_mine'))
          }
         .scrollable(false)
         .onChange((index:number)=>{
            this.tabsIndex=index
            this.controller.changeIndex(index)
          })
        }

        .width('100%')
        .backgroundColor($r('app.color.white'))
      }
      .title(this.builderNavTitle(), {
        backgroundColor: $r('app.color.main_theme'),
      })
      .mode(NavigationMode.Stack) // 导航栏与内容区独立显示，相当于两个页面。
      .titleMode(NavigationTitleMode.Mini) //
      .hideBackButton(true)
      .height('100%')
      .width('100%')
    }

  }
}
