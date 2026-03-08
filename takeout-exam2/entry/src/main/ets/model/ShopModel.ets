/**
 * 店铺 Model
 */
export class ShopModel {
  title: string = ''
  image: string = ''
  /**
   * 接受预定时间
   */
  bookTime?: string = ''
  /**
   * 评分
   */
  score: string = ''
  /**
   * 起送价格
   */
  startPrice?: number = 0
  /**
   * 配送时间
   */
  sendTime: string = ''
  /**
   * 配送距离
   */
  sendDistance?: string = ''
  /**
   * 配送费
   */
  extraPrice?: string = ''
  /**
   * 成交量
   */
  turnover?: string = ''
  /**
   * 人均价
   */
  avgPrice?: string = ''
  /**
   * 配送类型  1-团团专送 2-团团快送
   */
  deliveryType: string = ''
  /**
   * 点评信息数组
   */
  evaluateList?: string[] = []
  /**
   * 热销信息
   */
  hotSales?: string [] = []
  /**
   * 优惠活动集合
   */
  activity: string[] = []
  /**
   * 跟买信息
   */
  salesInfo?: string = ''

  constructor() {
  }
}
