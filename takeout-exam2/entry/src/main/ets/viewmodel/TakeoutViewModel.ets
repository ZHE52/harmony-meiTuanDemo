import { TakeoutGridData } from '../data/TakeoutGridData'
import { HomeGridModel } from '../model/HomeGridModel'
import { ShopModel } from '../model/ShopModel'
import { TakeoutGoodsModel } from '../model/TakeoutGoodsModel'
import { TakeGoodsData } from '../data/TakeGoodsData'
import { ShopData } from '../data/ShopData'

export default class TakeoutViewModel {
  gridData: Array<Array<HomeGridModel>> = TakeoutGridData
  /**
   * 外卖页面中间的数据
   */
  middleData: Array<TakeoutGoodsModel> = TakeGoodsData
  /**
   * 外卖页面店铺列表数据
   */
  shopListData: Array<ShopModel> = ShopData

  /**
   * 跳转到店铺详情页面
   */
  goDetail(data: ShopModel, pathStack: NavPathStack) {
    pathStack.pushPath(
      {
        name: 'ShopDetailPage',
        param: data,
      }
    )
  }
}