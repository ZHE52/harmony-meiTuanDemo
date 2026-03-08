/**
 * 套餐 Model
 */
export class ComboModel {
  /**
   * 套餐名称
   */
  comboName: string = ''
  /**
   * 套餐类型  1-人气套餐 2-热销套餐
   */
  comboType: string = ''
  /**
   * 套餐价格
   */
  price: number = 0
  /**
   * 套餐包含商品集合
   */
  comboGoods: Array<ComboGoodsModel> = []
}

/**
 * 套餐单个商品 Model
 */
export class ComboGoodsModel {
  /**
   * 名称
   */
  name: string = ''
  /**
   * 价格
   */
  price: number = 0
  /**
   * 图片
   */
  image: string = ''
}