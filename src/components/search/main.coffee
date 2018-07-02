export default
  data: ->
    searchValue: ''

  methods:
    confirm: (e) ->
      console.log(e.detail)
      this.$emit('clickSearch', e.detail)
      this.searchValue = ''