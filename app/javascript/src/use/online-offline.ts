import { Ref, ref, onMounted, onUnmounted } from 'vue';

export default function useOnlineOffline(): { online: Ref<boolean> } {
  const online = ref(navigator.onLine);

  function setOnline() {
    online.value = true;
  }

  function setOffline() {
    online.value = false;
  }

  onMounted(() => {
    window.addEventListener('online', setOnline);
    window.addEventListener('offline', setOffline);
  });

  onUnmounted(() => {
    window.removeEventListener('online', setOnline);
    window.removeEventListener('offline', setOffline);
  });

  return {
    online,
  };
}
