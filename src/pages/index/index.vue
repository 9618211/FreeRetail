<template lang='pug'>
.container
  .ver.seller
    input.storeId(
      type='number'
      :focus='true'
      v-model='storeId'
      placeholder='输入店号'
      @focus='passwordShow=false'
    )
    .nav
      button.go(
        @click='clickGo(0)'
      ) 我是卖家
      span.little(
        @click='regist'
      ) 注册卖家
      button.go(
        @click='clickGo(1)'
      ) 我是买家
  .ver.password(
    v-if='passwordShow'
  )
    input.storeId(
      type='password'
      v-model='password'
      placeholder='输入你的6位密码'
    )
    button.go(
      @click='login'
    ) 点击登录
  span.buyer-show(
    v-if='passwordShow'
    @click='passwordShow=false'
  ) 重置
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
    flex-direction: column
    justify-content: center
    align-items: center
    width: 100%
    margin: 40rpx 0

    .width
      width: 80%

    .storeId
      @extend .input
      @extend .width
      text-align: center
      padding: 0
      margin-bottom: 40rpx

    .nav
      @extend .width
      display: flex
      justify-content: space-between
      align-items: center

      .go
        background: $mainColor
        color: white

      .little
        font-size: 24rpx
        color: #bbb

  .buyer-show
    font-size: 24rpx
    color: #bbb
</style>
