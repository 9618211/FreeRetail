<template lang='pug'>
.search
  .input-box
    input.input(
      placeholder="搜索"
      confirm-type="search"
      @confirm="confirm"
      v-model="searchValue"
    )
</template>

<script>
import main from './main.coffee'

export default {
  ...main,
}
</script>

<style lang='sass' scoped>
.search
  display: flex
  justify-content: center
  align-items: center
  width: 100%
  height: 80rpx
  background: #e74a39

  .input-box
    position: relative
    width: 90%

    .input
      height: 64rpx
      background: white
      border-radius: 32rpx
      padding-left: 32rpx
      font-size: 28rpx
</style>
