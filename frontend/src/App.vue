<script setup>
import Autocomplete from './components/Autocomplete.vue';
import { onMounted } from 'vue';

const API_URL = import.meta.env.VITE_API_URL || '';

onMounted(async () => {
  console.log('connecting with Rails...');
  try {
    const response = await fetch(`${API_URL}/api/characters?query=Iron`);
    const data = await response.json();
    console.log('🎉 connected', data);
  } catch (err) {
    console.log('😞 no dice');
    console.error(err)
  }
});
</script>

<template>
  <header class="container">
    <h1>Find Marvel Characters</h1>
  </header>
  <main class="container">
    <Autocomplete />
  </main>
  <footer>
    <hr />
    <div class="container">
      Footer notes
    </div>
  </footer>
</template>
