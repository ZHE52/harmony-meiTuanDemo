import { EvalScoreComponent } from './component/EvalScoreComponent'
import { EvalTypeComponent } from './component/EvalTypeComponent'

/**
 * 评价 主页面
 */
@Component
export struct EvaluateMainComponent {
  build() {
    Column() {
      //评价页面 分数
      EvalScoreComponent()
      //评价页面 评价类别 部分
      EvalTypeComponent()
    }
    .backgroundColor($r('app.color.gray_bg'))
    .height('100%')
    .width('100%')
  }
}