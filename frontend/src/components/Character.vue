<script setup>
import { useRoute } from 'vue-router'
const route = useRoute()
const character = route.params.character
</script>

<template>
  <div>
    About {{ character.name }}
    <pre>{{ JSON.stringify(character, null, 2) }}</pre>
  </div>
</template>
