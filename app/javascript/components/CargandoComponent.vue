<template>
  <div id="cargando-component">
    <i v-if="cargando" class="fa fa-2x fa-cog fa-spin"></i>
  </div>
</template>

<script>
  export default {
    name: 'cargando-component',
    props: {
      cargando: {
        type: Boolean,
        required: true
      }
    }
  }
</script>
