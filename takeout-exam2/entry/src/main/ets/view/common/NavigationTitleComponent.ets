import HomeViewModel from '../../viewmodel/HomeViewModel'

/**
 * 自定义首页的 顶部导航栏
 */

@Component
export struct NavigationTitleComponent {
  controller: SearchController = new SearchController()
  @Consume homeViewModel: HomeViewModel

  build() {
    Row() {
      Text($r('app.string.city_text'))
        .fontSize(14).fontColor($r('app.color.normal_text'))
        .fontWeight(FontWeight.Bold)
        .margin({ right: 1 })
      Image($r('app.media.icon_arrow_down'))
        .width(14).height(16)
        .margin({ right: 5 })
      Row() {
        Image($r('app.media.icon_search'))
          .width(20).height(20)
          .margin({ left: 10 })
        TextInput({ placeholder: $r('app.string.search_text') })
          .fontSize(14)
          .layoutWeight(1)
          .padding({ left: 5 })
          .placeholderFont({ size: 14 })
          .backgroundColor($r('app.color.white'))
          .onChange((text) => {
            this.homeViewModel.searchKeyword = text
          })
          .id('main_index_search_input')

        Button($r('app.string.search_btn'))
          .backgroundColor($r('app.color.main_theme'))
          .fontColor($r('app.color.normal_text'))
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin(1)
      }
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))
      .borderRadius('50%')
      .margin({ left: 10, right: 10 })

      Image($r('app.media.icon_scan'))
        .width(30)
        .aspectRatio(1)
        .objectFit(ImageFit.Contain)

    }
    .padding(5)
    //.backgroundColor('#fcad69')
    .width('100%').padding(10)
  }
}