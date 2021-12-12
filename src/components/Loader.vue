<template>
    <span v-show="getLoader">    
        <b-spinner small
           variant="warning"
           type="grow"
        ></b-spinner>    
    </span>
</template>
<script>
export default {
  computed: {
    getLoader() {
      return this.$store.getters.getLoader;
    }
  },
};
</script>