<script setup>
import { RouterView } from 'vue-router'
</script>

<template>
  <header class="container">
    <h1>Find Marvel Characters</h1>
  </header>
  <main class="container">
    <RouterView />
  </main>
  <footer>
    <hr />
    <div class="container">
      Footer notes
    </div>
  </footer>
</template>

<style lang="scss" scoped>
  main {
    padding-top: 0;
    padding-bottom: 0;
  }
  h1 {
    margin-bottom: 0;
  }
</style>

<style lang="scss">
  // Loading icon from https://codepen.io/nikhil8krishnan/pen/rVoXJa
:root {
  --icon-loading-dark: url("data:image/svg+xml,%3Csvg version='1.1' id='L4' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 100 100' enable-background='new 0 0 0 0' xml:space='preserve'%3E%3Ccircle fill='%23fff' stroke='none' cx='6' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.1'/%3E%3C/circle%3E%3Ccircle fill='%23fff' stroke='none' cx='26' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.2'/%3E%3C/circle%3E%3Ccircle fill='%23fff' stroke='none' cx='46' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.3'/%3E%3C/circle%3E%3C/svg%3E");
  --icon-loading: url("data:image/svg+xml,%3Csvg version='1.1' id='L4' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 100 100' enable-background='new 0 0 0 0' xml:space='preserve'%3E%3Ccircle fill='%23000' stroke='none' cx='6' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.1'/%3E%3C/circle%3E%3Ccircle fill='%23000' stroke='none' cx='26' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.2'/%3E%3C/circle%3E%3Ccircle fill='%23000' stroke='none' cx='46' cy='50' r='6'%3E%3Canimate attributeName='opacity' dur='1s' values='0;1;0' repeatCount='indefinite' begin='0.3'/%3E%3C/circle%3E%3C/svg%3E");
}
@media only screen and (prefers-color-scheme: dark) {
  :root:not([data-theme=light]) {
    --icon-loading: var(--icon-loading-dark);
  }
}
[data-theme="dark"] {
  --icon-loading: var(--icon-loading-dark);
}

input[aria-busy="true"] {
  padding-right: calc(var(--form-element-spacing-horizontal) + 1.5rem)!important;
  background-image: var(--icon-loading);
  background-position: center right 0.5rem;
  background-size: 1.25rem auto;
  background-repeat: no-repeat;
}
</style>