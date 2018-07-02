export default
  props:
    type:
      type: String
      default: -> ''
    index:
      type: Number

  data: ->
    imgUrl: '#'

  mounted: ->
    this.imgUrl = require("@/assets/type#{this.index}.png")

  methods:
    clickType: (type) ->
      this.$emit 'clickType', { type }