<template lang='pug'>
.search
  .input-box
    input.input(
      placeholder="搜索"
      confirm-type="search"
      bindconfirm="confirm"
      :value="searchValue"
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
