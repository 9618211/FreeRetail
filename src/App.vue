<script>
let Bmob = require('@/utils/Bmob.js')
export default {
  created () {
    Bmob = require('@/utils/Bmob.js')
    Bmob.initialize("10c20307173e1e708410686adc74e74b", "7d35e8a8e11a1101dffca33daabf12e0")
  }
}
</script>

<style>
.container {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  box-sizing: border-box;
}

* {
  transition: width 2s;
  -moz-transition: width 2s;
  -webkit-transition: width 2s;
  -o-transition: width 2s;
}
</style>
