import { BackBtnComponent } from './BackBtnComponent'
import { ShopModel } from '../../../../../model/ShopModel'
import { DiscoutComponent } from './DiscountComponent'

/**
 * 头部卡片组件
 */
@Component
export struct TopCardComponent {
  /**
   * 小图片的宽高
   */
  imgW: number = 12
  @Prop shopData: ShopModel

  /**
   * 渲染名称 这一行
   */
  @Builder
  builderTitleRow() {
    Row() {
      Row() {
        Text(this.shopData.title)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.icon_arrow_right'))
          .width(14).height(14)
          .margin({ left: 5 })
      }

      Text($r('app.string.collect_text'))
        .fontSize(12)
        .fontColor($r('app.color.normal_text'))
        .padding({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })
        .borderWidth(1)
        .borderColor($r('app.color.gray3'))
        .borderRadius(4)
    }
    .margin({ bottom: 5 })
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  /**
   * 渲染第二行 人气榜
   */
  @Builder
  builderTwoRow() {
    //有热销信息的时候 渲染热销信息
    if (this.shopData.hotSales) {
      Row() {
        Image($r('app.media.icon_bd2'))
          .width(this.imgW).height(this.imgW)
          .margin({ left: 4, right: 2 })
        Text(this.shopData.hotSales[0])
          .fontSize(12)
        //分隔线
        Column() {

        }
        .width(1).height(10)
        .backgroundColor($r('app.color.split_gray'))
        .margin({ left: 4, right: 4 })

        this.builderDeliveryTime()
      }
    } else {
      //没有热销信息的时候 渲染评分信息
    }

  }

  /**
   * 渲染配送时间
   */
  @Builder
  builderDeliveryTime() {
    Row() {
      Image($r('app.media.icon_time'))
        .width(this.imgW).height(this.imgW)
        .margin({ right: 2 })
      Text() {
        Span($r('app.string.send_text'))
        Span(this.shopData.sendTime)
      }.fontSize(12)
    }
  }

  build() {
    Column() {
      //返回、分享 按钮组件
      BackBtnComponent()
      Column() {
        Row() {
          Image($r('app.media.' + this.shopData.image))
            .width(40)
            .height(40)
            .margin({ right: 5 })
            .borderRadius(5)
          Column() {
            this.builderTitleRow()
            this.builderTwoRow()
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
        }

        //店铺公告部分
        Text() {
          Span($r('app.string.shop_msg'))
          Span($r('app.string.shop_notice'))
        }
        .margin({ top: 4, bottom: 4 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis }) // 溢出部分显示省略号
        .fontSize(12)
        .fontColor($r('app.color.gray_text'))

        //折扣信息
        DiscoutComponent({ items: this.shopData.activity })
      }
      .alignItems(HorizontalAlign.Start)
      .padding(10)
      .margin({ top: 10 })
      .width('100%')
      .borderRadius(10)
      .backgroundColor($r('app.color.white'))
      .shadow({
        radius: 16,
        color: '#30000000',
        offsetX: 0,
        offsetY: 8
      })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .padding({ left: 10, right: 10 })

  }
}