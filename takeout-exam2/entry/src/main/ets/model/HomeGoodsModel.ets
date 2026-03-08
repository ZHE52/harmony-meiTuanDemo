/**
 * 首页商品数据模型
 */
export class HomeGoodsModel {
  /**
   * 商品标题
   */
  title: string = ''
  /**
   * 商品图片资源标识
   */
  image: string = ''
  /**
   * 商品类型
   */
  type: string = ''
  /**
   * 配送时间
   */
  time: string = ''
  /**
   * 优惠活动集合
   */
  activity: string[] = []
  /**
   * 评分
   */
  score: string = ''
  /**
   * 成交量
   */
  turnover: string = ''
}
