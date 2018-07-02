import Bmob from '@/utils/Bmob'

export default
  data:
    sellerId: ''
    buyerId: ''

  methods:
    clickGo: (type) ->
      switch type
        when 0 then this.goSeller null # 卖家是0
        else this.goBuyer null # 买家是1

    goSeller: ->
      wx.showToast title: '尚未处理'

    goBuyer: ->
      query = Bmob.Query '_User'
      query.equalTo 'storeId', '==', Number(this.buyerId || -1) # 默认是请求-1, -1没有值
      query.find null
        .then (res) =>
          if res.length
            result = res[0]
            owner = result.username
            mobile = result.mobilePhoneNumber
            wx.redirectTo url: "/pages/buyer/main?owner=#{owner}&mobile=#{mobile}"
          else
            wx.showToast
              title: '没有对应门店'
              icon: 'none'
        .catch (err) ->
          console.log err