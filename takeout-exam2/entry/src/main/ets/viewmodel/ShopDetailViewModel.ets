import { TypeModel } from '../model/TypeModel'
import { ShopGoodsModel } from '../model/ShopGoodsModel'
import { ComboModel } from '../model/ComboModel'
import { TypeData } from '../data/TypeData'
import { ShopGoodsData } from '../data/ShopGoodsData'
import { EvalTypeData } from '../data/EvalTypeData'
import { ComboData } from '../data/ComboData'

@Observed
export default class ShopDetailViewModel {
  /**
   * 商品总价
   */
  totalPrice: number = 0
  /**
   * 套餐数据
   */
  comboData: Array<ComboModel> = ComboData
  /**
   * 评价类型选中的索引
   */
  evalTypeIndex = 0
  /**
   * 评价页面 评价类别
   */
  evalTypeData = EvalTypeData
  /**
   * 左侧分类列表 滚动控制器
   */
  goodsTypeScroller: Scroller = new Scroller();
  /**
   * 右侧商品列表 滚动控制器
   */
  goodsListScroller: Scroller = new Scroller();
  /**
   * 店铺详情页的商品列表
   */
  shopGoodsData: Array<ShopGoodsModel> = ShopGoodsData
  /**
   * 选中的分类索引
   */
  typeIndex: number = 0
  /**
   * 店铺详情左侧的分类数据
   */
  typeData: Array<TypeModel> = TypeData
  /**
   * tab的控制器
   */
  tabController: TabsController = new TabsController()
  /**
   * 选中tab的索引
   */
  tabIndex: number = 0

  /**
   * 计算商品总价（累加到总价中）
   * @param item 商品数据
   */
  calcTotalPrice(item: ShopGoodsModel) {
    this.totalPrice += (item.price + (item.pricePoint ? parseFloat(item.pricePoint) : 0))
  }

  /**
   * 点击评价类别时切换选中状态
   * @param index 评价类别索引
   */
  evalTypeChange(index: number) {
    this.evalTypeIndex = index
  }

  /**
   * 监听右侧商品列表滚动，同步更新左侧分类高亮状态
   * @param index 当前滚动到的商品索引
   */
  rightOnScroll(index: number) {
    // TODO: 考点7 - 商品详情页左右列表联动功能实现
    let typeIndex=this.shopGoodsData[index].typeIndex//拿到分类索引
    this.typeIndex=typeIndex
    this.goodsTypeScroller.scrollToIndex(typeIndex)

    // 功能要求：实现右侧商品列表滚动时，左侧分类列表自动高亮并滚动到对应位置
    // 实现步骤：
    // - 根据传入的商品索引index，从this.shopGoodsData数组中获取对应商品的typeIndex属性（分类索引）
    // - 将获取到的typeIndex赋值给this.typeIndex，实现左侧分类高亮
    // - 调用this.goodsTypeScroller的滚动方法，传入typeIndex参数，使左侧分类列表滚动到对应位置
    // 注意事项：
    // - 确保从this.shopGoodsData数组中正确获取当前商品的typeIndex属性
    // - 更新this.typeIndex后，左侧分类列表会自动高亮对应项
    // - 使用滚动控制器方法时，传入的参数是分类索引typeIndex

    // let typeIndex = this.shopGoodsData[index].typeIndex
    // this.typeIndex = typeIndex
    // this.goodsTypeScroller.scrollToIndex(typeIndex)
  }

  /**
   * 店铺详情页左侧分类点击，右侧商品列表滚动到对应位置
   * @param index 分类索引
   */
  typeChange(index: number) {
    // TODO: 考点8 - 商品详情页左侧分类点击联动功能实现

    this.typeIndex= index
    let typeIndex=this.getRightItemIndex(index)
    if (typeIndex !==-1) {
      this.goodsListScroller.scrollToIndex(typeIndex)
    }

    // 功能要求：实现左侧分类点击时，右侧商品列表自动滚动到对应商品位置
    // 实现步骤：
    // - 将传入的分类索引index赋值给this.typeIndex，实现左侧分类高亮
    // - 调用this.getRightItemIndex方法，传入分类索引index，获取该分类对应的首个商品在右侧列表中的索引，将返回值保存到变量中
    // - 判断获取到的商品索引是否不等于-1（-1表示未找到对应商品）
    // - 如果找到了对应商品（索引不为-1），则调用this.goodsListScroller的滚动方法，传入商品索引参数，使右侧商品列表滚动到对应位置
    // 注意事项：
    // - this.getRightItemIndex方法会返回对应分类的首个商品索引，如果未找到则返回-1
    // - 必须先判断返回值是否为-1，避免滚动到错误位置
    // - 更新this.typeIndex后，左侧分类列表会自动高亮对应项

    // this.typeIndex = index
    // let itemIndex = this.getRightItemIndex(index)
    // if (itemIndex !== -1) {
    //   this.goodsListScroller.scrollToIndex(itemIndex)
    // }
  }

  /**
   * 根据左侧分类索引，获取对应右侧商品列表的首个商品索引
   * @param typeIndex 左侧分类索引
   * @returns 右侧商品索引，未找到返回-1
   */
  getRightItemIndex(typeIndex: number): number {
    // TODO: 考点9 - 根据分类索引查找首个商品索引功能实现

    // 功能要求：根据传入的分类索引，在商品列表中查找并返回该分类下首个商品的索引位置
    // 实现步骤：
    // - 声明一个变量findIndex并初始化为-1，用于存储找到的商品索引（-1表示未找到）
    // - 使用for循环遍历this.shopGoodsData数组，循环变量i从0开始，到数组长度结束
    // - 在循环内部，获取当前索引i对应的商品数据对象，保存到变量item中
    // - 判断当前商品对象item的typeIndex属性是否等于传入的参数typeIndex
    // - 如果相等，说明找到了该分类的首个商品：
    //   - 将当前循环索引i赋值给findIndex
    //   - 使用break语句跳出循环（因为只需要找到首个匹配的商品）
    // - 循环结束后，返回findIndex变量（找到返回商品索引，未找到返回-1）
    // 注意事项：
    // - 必须初始化findIndex为-1，作为未找到的标识
    // - 找到首个匹配项后必须使用break跳出循环，避免继续查找
    // - 返回值-1表示该分类下没有商品数据

    let findIndex = -1
    for (let i = 0; i < this.shopGoodsData.length; i++) {
      let item = this.shopGoodsData[i]
      if (item.typeIndex === typeIndex) {
        findIndex = i
        break
      }
    }
    return findIndex
  }

  /**
   * 处理tab的切换（点菜/套餐/评价）
   * @param index tab索引
   */
  tabChanage(index: number) {
    this.tabIndex = index
    this.tabController.changeIndex(index)
  }
}