<template lang='pug'>
.goods
  image.img(
    mode="aspectFit"
    :src="goods.url"
  )
  span.name 品名: {{goods.name}}
  span.price 价格: {{goods.price}}
</template>

<script>
export default {
  props: {
    goods: {
      type: Object,
      required: true,
    }
  }
}
</script>

<style lang='sass' scoped>
.goods
  width: 320rpx
  display: flex
  flex-direction: column
  margin-bottom: 32rpx

  .img
    max-width: 320rpx
    max-height: 320rpx

  .name, .price
    margin-top: 8rpx
    color: #666
    font-size: 24rpx
</style>
