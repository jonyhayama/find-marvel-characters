<script setup>
import { useRoute } from 'vue-router'
const route = useRoute()
const character = route.params.character
const [{ comics, series, stories, events, urls, description }] = character.externalData || [{}]
const sections = [
  { title: 'Comics', collection: comics },
  { title: 'Series', collection: series },
  { title: 'Stories', collection: stories },
  { title: 'Events', collection: events }
]
</script>

<template>
  <div>
    <h2>{{ character.name }}</h2>
    <div class="grid">
      <div>
        <img :src="character.thumbnail_url" />
      </div>
      <div>
        <div v-if="description">{{ description }}</div>
        <ul>
          <li v-for="url in urls">
            <a :href="url.url" target="_blank">{{ url.type }}</a>
          </li>
        </ul>

        <ul>
          <li v-for="(section, index) in sections" :key="index">
            {{ section.collection.available }} {{ section.title }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
