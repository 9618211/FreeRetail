import Bmob from '@/utils/Bmob'
import main from '@/mixins/main.coffee'

export default
  mixins: [main]

  data:
    sellerId: ''
    buyerId: ''
    storeId: ''
    password: ''
    passwordShow: false # 是否显示密码框

  methods:
    clickGo: (type) ->
      switch type
        when 0 then this.goSeller null # 卖家是0
        else this.goBuyer null # 买家是1

    goSeller: ->
      this.checkStoreId(this.storeId)
        .then (result) =>
          this.username = result.username
          this.passwordShow = true
        .catch (err) ->
          wx.showToast
            title: err
            icon: 'none'

    goBuyer: ->
      this.checkStoreId(this.storeId)
        .then (result) =>
          owner = result.username
          mobile = result.mobilePhoneNumber
          wx.navigateTo url: "/pages/buyer/main?owner=#{owner}&mobile=#{mobile}"
        .catch (err) ->
          wx.showToast
            title: err
            icon: 'none'

    checkStoreId: (storeId) ->
      query = Bmob.Query '_User'
      query.equalTo 'storeId', '==', Number(storeId || -1) # 默认是请求-1, -1没有值
      wx.showLoading title:'正在检查门店号'
      return query.find null
        .then (res) =>
          wx.hideLoading null
          if res.length
            result = res[0]
            Promise.resolve result
          else
            Promise.reject '没有对应门店'

    login: ->
      Bmob.User.login this.username, this.password
        .then (res) =>
          owner = res.username
          mobile = res.mobilePhoneNumber
          wx.navigateTo url: "/pages/seller/main?owner=#{owner}&mobile=#{mobile}"
        .catch (err) ->
          wx.showToast
            title: '登录失败' # err.error
            icon: 'none'