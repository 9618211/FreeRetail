import banner from '@/assets/banner.png'
import main from '@/mixins/main.coffee'

Bmob = require '@/utils/Bmob.js'
owner = ''

export default
  mixins: [main]

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
    mobile: ''

  mounted: ->
    this.query()

  onLoad: (option) ->
    owner = option.owner
    this.mobile = option.mobile

  methods:
    query: (value) ->
      query = Bmob.Query 'Goods'
      query.equalTo "owner", '==', owner
      currentType = this.currentType
      query.equalTo "type", '==', currentType if currentType isnt '全部'

      wx.showLoading title: '搜索中...'

      query.find()
        .then (results) =>
          wx.hideLoading null
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