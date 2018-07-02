export default
  props: ->
    type:
      type: String
      default: -> ''
    index:
      type: Number

  methods:
    clickType: (e) ->
      this.$emit('clickType', { type: e.currentTarget.dataset.type })