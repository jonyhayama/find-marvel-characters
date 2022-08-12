<script setup>
import { ref, watch } from 'vue';
const API_URL = import.meta.env.VITE_API_URL || '';

const timeout = ref(null);
const search = ref('');
const results = ref([]);
const hasError = ref(false);
const isLoading = ref(false);
const searches = ref({});

const debouncedSearch = (event) => {
  clearTimeout(timeout.value);
  timeout.value = setTimeout(() => {
    search.value = event.target.value
  }, 300);
}

watch(search, async (newSearch, _oldVal) => {
  if(!newSearch) {
    results.value = [];
    return;
  }

  if(Object.keys(searches.value).includes(newSearch)) {
    results.value = searches.value[newSearch];
    return;
  }

  hasError.value = false;
  isLoading.value = true;

  const response = await fetch(`${API_URL}/api/characters?${new URLSearchParams({ query: newSearch })}`);
  if (response.ok) {
    const { data } = await response.json();
    searches.value[newSearch] = data;
    results.value = data;
  } else {
    hasError.value = true;
  }
  isLoading.value = false;
})
</script>

<template>
  <label>Type a character name</label>
  <input type="text" @input="debouncedSearch" />

  <div v-if="hasError">
    Oops, something went wrong, try again later.
  </div>
  <div v-if="isLoading">
    Searching...
  </div>
  <div v-if="!isLoading && !hasError" class="grid">
    <div v-for="character in results" :key="character.id" :value="character.id">
      <img :src="character.thumbnail_url" />
      <span>{{ character.name }}</span>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.grid {
  grid-template-columns: 1fr 1fr;
  grid-row-gap: var(--grid-spacing-horizontal);

  div {
    padding: calc(var(--spacing)/ 2) calc(var(--spacing)/ 2);
    border-radius: var(--border-radius);
    background: var(--code-background-color);
    display: flex;
    align-items: center;

    img {
      width: 80px;
      height: 80px;
      border-radius: var(--border-radius);
      object-fit: cover;

      & + span {
        margin-left: calc(var(--spacing)/ 2)
      }
    }
  }
}
</style>