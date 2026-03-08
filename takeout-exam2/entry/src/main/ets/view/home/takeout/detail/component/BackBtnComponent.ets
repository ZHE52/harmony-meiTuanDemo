/**
 * 头部返回按钮 和分享组件
 */
@Component
export struct BackBtnComponent {
  @Consume pathStack: NavPathStack
//  uiContext: UIContext = this.getUIContext();

  uiContext:UIContext=this.getUIContext();
  /**
   * 点击分享图标响应
   */
  shareClick() {
    // TODO: 考点11 - 分享功能Toast提示实现
    // 功能要求：实现点击分享按钮后显示Toast提示消息
    // 提示消息要求：
    // - 消息内容为 '分享成功'
    // - 显示时长为 3000毫秒（3秒）
    // 注意事项：
    // - Toast消息内容必须严格为 '分享成功'，不能随意修改，否则测试不通过
    // - this.uiContext已在组件中初始化，可以直接使用
    // - 需要通过UI上下文获取提示功能并显示Toast消息

    this.uiContext.getPromptAction().showToast({
      message: '分享成功',
      duration: 3000
    })
    // this.uiContext.getPromptAction().showToast({
    //   message: '分享成功',
    //   duration: 3000
    // })
  }

  build() {
    Row() {
      Image($r('app.media.icon_arrow_left_white'))
        .width(24).height(24)
        .onClick(() => {
          this.pathStack.pop()
        })
        .id('main_detail_back')
      Image($r('app.media.icon_share'))
        .width(20).height(20)
        .onClick(() => {
          this.shareClick()
        })
        .id('main_detail_share')

    }
    .width('100%')
    .padding({ left: 15, right: 20, top: 20 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}