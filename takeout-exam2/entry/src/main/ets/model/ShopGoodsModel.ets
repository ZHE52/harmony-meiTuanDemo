/**
 * 店铺详情页 商品model
 */
export class ShopGoodsModel {
  /**
   * 图片
   */
  image: string = ''
  /**
   * 对应左侧分类的索引
   */
  typeIndex: number = 0
  /**
   * 是否红色标题
   */
  redText?: boolean = false
  /**
   * 份数
   */
  quantity?: string = ''
  /**
   * 商品名称
   */
  title: string = ''
  /**
   * 1-招牌 2-新品
   */
  type: string = ''
  /**
   * 销量
   */
  turnover: string = ''
  /**
   * 优惠活动集合
   */
  activity?: string[] = []
  /**
   * 价格
   */
  price: number = 0
  /**
   * 价格小数点
   */
  pricePoint?: string = ''
  /**
   * 好评度
   */
  goodEval?: string = ''
}