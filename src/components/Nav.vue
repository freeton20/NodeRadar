<template>
<div>
  <b-navbar  style="z-index: 1000;" toggleable="lg" type="dark" variant="dark">
    <b-navbar-brand href="#" style="margin-left: 3rem; color: yellow; font-weight: bold;">
    NODE RADAR  📡  <span><Loader/></span></b-navbar-brand>     
  </b-navbar>
</div>
</template>
<script>
import Loader from "./Loader.vue";
export default {
  components: { Loader }
}
</script>
