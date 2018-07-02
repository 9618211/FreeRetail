<template lang='pug'>
.type(
  @click='clickType(type)'
)
  img.img(
    :src="imgUrl"
  )
  span.name(
    mode="aspectFit"
  ) {{type}}
</template>

<script>
import main from './main.coffee'

export default {
  ...main,
}
</script>

<style lang='sass' scoped>
.type
  display: flex
  flex-direction: column
  align-items: center
  width: 160rpx
  height: 160rpx
  margin: 16rpx 0

  .img
    width: 120rpx
    height: 120rpx
    border-radius: 60rpx

  .name
    font-size: 24rpx
</style>
