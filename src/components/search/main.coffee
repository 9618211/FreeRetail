export default
  data: ->
    searchValue: ''

  methods:
    confirm: (e) ->
      this.$emit 'clickSearch', { searchValue: this.searchValue }
      this.searchValue = ''