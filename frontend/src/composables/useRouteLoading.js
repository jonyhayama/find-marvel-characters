import { ref } from 'vue';
const isLoading = ref(true);

const setLoading = (progress) => {
  isLoading.value = progress;
}

export default function useRouteLoading () {
  return {
    isLoading,
    setLoading
  }
}