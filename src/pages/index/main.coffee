import Bmob from '@/utils/Bmob'

export default
  data:
    sellerId: ''
    buyerId: ''

  methods:
    clickGo: (type) ->
      switch type
        when 1 then this.goBuyer null # 买家是1
        else this.goSeller null # 卖家是0

    goSeller: ->
      wx.showToast title: '尚未处理'

    goBuyer: ->
      query = Bmob.Query '_User'
      query.equalTo 'storeId', '==', Number(this.buyerId || -1) # 默认是请求-1, -1没有值
      query.find null
        .then (res) =>
          if res.length
            owner = res[0].username
            wx.redirectTo url: "/pages/buyer/main?owner=#{owner}"
          else
            wx.showToast
              title: '没有对应门店'
              icon: 'none'
        .catch (err) ->
          console.log err