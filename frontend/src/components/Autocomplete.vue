<script setup>
import { ref, watch } from 'vue';
const API_URL = import.meta.env.VITE_API_URL || '';

const timeout = ref(null);
const search = ref('');
const results = ref([]);
const searches = ref({});
const state = ref('idle');

const debouncedSearch = (event) => {
  clearTimeout(timeout.value);
  timeout.value = setTimeout(() => {
    search.value = event.target.value
  }, 300);
}

const doSearch = async () => {
  if(!search.value) {
    results.value = [];
    state.value = 'idle';
    return;
  }

  if(Object.keys(searches.value).includes(search.value)) {
    results.value = searches.value[search.value];
    state.value = 'success';
    return;
  }

  state.value = 'loading';
  const response = await fetch(`${API_URL}/api/characters?${new URLSearchParams({ query: search.value })}`);
  if (response.ok) {
    const { data } = await response.json();
    searches.value[search.value] = data;
    results.value = data;
    state.value = 'success';
  } else {
    state.value = 'error';
  }
}

watch(search, async (_newVal, _oldVal) => {
  doSearch();
})
</script>

<template>
  <label>Type a character name</label>
  <input
    type="text"
    @input="debouncedSearch"
    @keyup.enter="doSearch"
    :aria-busy="state === 'loading'"
    :aria-invalid="state === 'error' ? true : null"
  />
  <div v-if="state === 'error'" class="error-msg">
    Oops, something went wrong, try again later.
  </div>
  <template v-if="state === 'success'" >
    <div v-if="results.length === 0">No characters found with your search term.</div>
    <div v-else class="grid">
      <div v-for="character in results" :key="character.id" :value="character.id">
        <img :src="character.thumbnail_url" />
        <span>{{ character.name }}</span>
      </div>
    </div>
  </template>
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

.error-msg {
  font-size: 0.75em;
  color: var(--del-color);
  margin-top: -1em;
}
</style>