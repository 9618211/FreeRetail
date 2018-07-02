export default
  props:
    type:
      type: String
      default: -> ''
    index:
      type: Number

  mounted: ->
    console.log this.index

  methods:
    clickType: (type) ->
      this.$emit 'clickType', { type }