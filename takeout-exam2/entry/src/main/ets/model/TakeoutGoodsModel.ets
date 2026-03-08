/**
 * 外卖商品数据模型
 */
export class TakeoutGoodsModel {
  /**
   * 商品图片资源标识
   */
  uri: string = ''
  /**
   * 商品标题
   */
  title: string = ''
  /**
   * 商品副标题
   */
  subTitle: string = ''
  /**
   * 现价
   */
  price: number = 0
  /**
   * 原价
   */
  primaryPrice: number = 0
}
