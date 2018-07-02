<template lang='pug'>
.container
  search(@clickSearch="clickSearch")
  swiper(
    :indicator-dots="bannerConfig.showDots"
    :autoplay="bannerConfig.autoplay"
    :interval="bannerConfig.interval"
    :duration="bannerConfig.duration"
    :circular="bannerConfig.circular"
  )
    block(
      v-for="(url, index) of bannerConfig.urls" :key="index"
    )
      swiper-item
        img.banner(
          :src="url"
          mode="aspectFill"
          width="355"
          height="150")
  .types
    type(
      v-for="(type, index) of types" :key="index"
      :type="type"
      :index="index"
      @clickType="clickType")
  .current-type-block
    .current-red
    .current-type {{currentType}}
  .goods-block(v-if="allGoods.length > 0")
    goods(
      v-for="(goods, index) of allGoods" :key="index"
      :goods="goods")
  .nothing(wx:else)
    icon(type="warn" size="20")
    span.nothing-text 什么都没有...
  .bottom
    span(
      @click="callPhone"
    ) 联系号码：
      span.phone-number 18888888888
</template>

<script>
import main from './main.coffee'
import goods from '@/components/goods/index'
import search from '@/components/search/index'
import type from '@/components/type/index'

export default {
  components: {
    goods,
    search,
    type,
  },
	...main,
}
</script>

<style scoped lang='sass'>
.container
  height: calc(100% - 80rpx)
  overflow-y: scroll

  swiper
    width: 100%

  .banner
    width: 100%
    height: 320rpx

  .types
    display: flex
    flex-wrap: wrap
    justify-content: space-around

  .current-type-block
    display: flex
    align-items: center
    width: 100%
    height: 48rpx

  .current-red
    width: 16rpx
    height: 40rpx
    margin: 0 16rpx 0 32rpx
    background: rgb(231, 74, 57)

  .current-type
    font-size: 28rpx

  .goods-block
    display: flex
    flex-wrap: wrap
    justify-content: space-between
    align-content: flex-start
    width: 100%
    padding: 0 32rpx

  .nothing
    display: flex
    align-items: center
    margin: 32rpx 0 32rpx 32rpx
    width: 100%

  .nothing-text
    font-size: 28rpx
    color: #666

  .bottom
    position: fixed
    bottom: 0
    display: flex
    justify-content: center
    align-items: center
    width: 100%
    height: 80rpx
    font-size: 28rpx
    color: white
    background: #e74a39

  .phone-number
    text-decoration: underline
</style>