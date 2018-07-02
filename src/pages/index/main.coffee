import banner from '@/assets/banner.png'
Bmob = require '@/utils/Bmob.js'

export default
  data:
    allGoods: [] # 所有商品
    types: ['全部', '海鲜', '火锅料', '猪', '牛羊', '鸡', '鸭', '其他美食']
    currentType: '全部'
    bannerConfig:
      urls: [
        banner
        "http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg"
      ]
      circular: true
      showDots: true
      interval: 3000
      duration: 300
      autoplay: true

  onReady: ->
    Bmob = require '@/utils/Bmob.js'
    Bmob.initialize "10c20307173e1e708410686adc74e74b", "7d35e8a8e11a1101dffca33daabf12e0"

  mounted: ->
    this.query()

  methods:
    query: (value) ->
      query = Bmob.Query 'Goods'
      query.equalTo "owner", '==', 'zweizhao'
      currentType = this.currentType
      query.equalTo "type", '==', currentType if currentType isnt '全部'

      wx.showLoading {title: '搜索中...'}

      query.find()
        .then (results) =>
          wx.hideLoading()
          allGoods = []
          for result in results
            name = result.name
            if value?
              if name.includes value
                allGoods.push
                  url: result.url
                  price: '¥' + result.price
                  name: name
              else
                continue
            else
              allGoods.push
                url: result.url
                price: '¥' + result.price
                name: name
          this.allGoods = allGoods

        .catch (error) ->
          wx.hideLoading()
          console.log error

    clickType:(payload) ->
      this.currentType = payload.type
      this.query()

    clickSearch: (payload) ->
      value = payload.searchValue
      this.query value
      this.currentType = value

    callPhone: ->
      wx.makePhoneCall
        phoneNumber: '18888888888'