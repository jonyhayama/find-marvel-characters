import { createRouter, createWebHistory } from 'vue-router'
import Autocomplete from '../components/Autocomplete.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Autocomplete
    },
    {
      path: '/:character',
      name: 'character',
      props: true,
      component: () => import('../components/Character.vue'),
      async beforeEnter(to) {
        const API_URL = import.meta.env.VITE_API_URL || '';
        const character = to.params.character

        const response = await fetch(`${API_URL}/api/characters/${character}`);
        if (response.ok) {
          const { data } = await response.json();
          to.params.character = data;
        } else {
          const routeName = (response.status === 404) ? 'not-found' : 'error'
          return {
            name: routeName,
            params: {
              pathMatch: to.path.substring(1).split('/')
            },
            query: to.query,
            hash: to.hash
          }
        }
      }
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      component: () => import('../components/NotFound.vue')
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'error',
      component: () => import('../components/Error.vue')
    }
  ]
})

export default router
