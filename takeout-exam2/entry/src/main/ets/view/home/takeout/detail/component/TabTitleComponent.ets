import ShopDetailViewModel from '../../../../../viewmodel/ShopDetailViewModel'

/**
 * tab的标题组件
 */
@Component
export struct TabTitleComponent {
  @Consume detailViewModel: ShopDetailViewModel
  @Prop index: number
  @Prop text: Resource

  build() {
    Text(this.text)
      .fontSize(14)
      .margin({ left: 15, right: 15 })
      .padding({ top: 8, bottom: 8 })
      .fontWeight(this.detailViewModel.tabIndex == this.index ? FontWeight.Bold : FontWeight.Normal)
      .fontColor(this.detailViewModel.tabIndex == this.index
        ? $r('app.color.normal_text') : $r('app.color.gray_text2'))
      //text_under
      .border({
        width: { bottom: 2 },
        color: this.detailViewModel.tabIndex == this.index ? $r('app.color.text_under') : $r('app.color.white')
      })
      .onClick(() => {
        this.detailViewModel.tabChanage(this.index)
      })
      .id(`main_detail_tab_${this.index}`)
  }
}