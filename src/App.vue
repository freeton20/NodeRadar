<template>
  <div id="app">
    <Nav/> 
    <Map/>
  </div>  
</template>

<script>
 import Map from './components/Map.vue'
 import Nav from './components/Nav.vue'

export default {
  name: "App",
   components: {Nav, Map},
};
</script>

<style>
#app {
}
</style>
