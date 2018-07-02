<template lang='pug'>
.container
  .ver.seller
    input.storeId(
      type='number'
      v-model='sellerId'
      placeholder='输入你的店号'
    )
    button.go(
      @click='clickGo(0)'
    ) 前往卖家
  .ver.buyer
    input.storeId(
      type='number'
      v-model='buyerId'
      :focus='true'
      placeholder='输入店号'
    )
    button.go(
      @click='clickGo(1)'
    ) 前往买家
</template>

<script>
import main from './main.coffee'

export default {
  ...main,
}
</script>

<style lang='sass' scoped>
@import '@/sass/main.sass'

.container
  position: absolute
  top: 0
  bottom: 0
  width: 100%
  justify-content: center

  .ver
    display: flex
    justify-content: center
    align-itemds: center
    width: 100%
    margin: 40rpx 0

    .storeId
      @extend .input
      width: 320rpx
      margin-right: 40rpx
      text-align: center
      padding: 0

    .go
      background: $mainColor
      color: white
</style>
