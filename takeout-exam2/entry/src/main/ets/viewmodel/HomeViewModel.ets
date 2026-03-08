import { HomeGridData } from '../data/HomeGridData'
import { HomeGridModel } from '../model/HomeGridModel'
import { HomeGoodsData } from '../data/HomeGoodsData'
import { HomeGoodsModel } from '../model/HomeGoodsModel'
import { ShopModel } from '../model/ShopModel'

export default class HomeViewModel {
  /**
   * 首页搜索关键字
   */
  searchKeyword: string = ''
  /**
   * 首页的商铺数据
   */
  goodsData: Array<HomeGoodsModel> = HomeGoodsData
  /**
   * 首页顶部的宫格数据
   */
  gridData: Array<Array<HomeGridModel>> = HomeGridData

  /**
   * 获取首页的商铺数据（支持搜索关键字过滤）
   * @returns 商铺数据数组
   */
  getShopData() {
    // TODO: 考点2 - 首页搜索关键字过滤功能实现
    // 功能要求：根据搜索关键字过滤商铺数据，返回符合条件的商铺列表
    // 实现步骤：
    // - 判断this.searchKeyword是否有值（非空字符串）
    // - 如果有搜索关键字：
    //   - 使用数组的过滤方法过滤this.goodsData数组
    //   - 过滤条件：商铺标题中包含搜索关键字（使用字符串查找方法判断是否包含，返回值不等于-1表示包含）
    //   - 返回过滤后的数组
    // - 如果没有搜索关键字：
    //   - 直接返回完整的this.goodsData数组
    // 注意事项：
    // - 字符串查找返回-1表示未找到，其他值表示找到的位置索引
    // - 过滤逻辑需要在箭头函数中实现
    // - 必须返回数组类型

    if (this.searchKeyword && this.searchKeyword.trim().length > 0) {
      //return this.goodsData.filter(item => item.title.indexOf(this.searchKeyword) !== -1)
        return this.goodsData.filter(item => item.title.indexOf(this.searchKeyword) !== -1)
     }
    return this.goodsData
  }

  /**
   * 跳转到店铺详情页面
   */
  goDetail(data: HomeGoodsModel, pathStack: NavPathStack) {
    let shop: ShopModel = new ShopModel()
    shop.sendTime = data.time
    shop.title = data.title
    shop.image = data.image
    shop.hotSales = ['热销榜']
    pathStack.pushPath(
      {
        name: 'ShopDetailPage',
        param: shop,
      }
    )
  }

  /**
   * 跳转到外卖页面
   * @param index 宫格索引
   * @param pathStack 导航栈
   */
  goToPage(index: number, pathStack: NavPathStack) {
    pathStack.pushPath(
      {
        name: 'TakeoutPage',
      }
    )
  }
}