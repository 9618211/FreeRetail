export default
  onLoad: (option) ->
    wx.showShareMenu
      withShareTicket: false

  onShareAppMessage: ->
    title: '小本生意实体网店，就该免费使用。'