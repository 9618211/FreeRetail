export default
  data:
    a: '1'

  methods:
    clickGo: (type) ->
      switch type
        when 1 then wx.redirectTo
          url: '/pages/buyer/main'
        else console.log 'null'