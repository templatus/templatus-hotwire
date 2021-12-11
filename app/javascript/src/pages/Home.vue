<script setup="props" lang="ts">
import { onMounted, onBeforeUnmount } from 'vue';
import PageTitle from '@/components/PageTitle.vue';
import ClickList from '@/components/ClickList.vue';
import ClickButton from '@/components/ClickButton.vue';
import { useClickStore } from '@/stores/click';

defineProps({
  name: {
    type: String,
    required: true,
  },
});

const store = useClickStore();
onMounted(() => {
  store.getClicks();
  store.subscribe();
});

onBeforeUnmount(() => {
  store.unsubscribe();
});
</script>

<template>
  <div class="flex flex-wrap justify-between">
    <div class="w-full md:w-1/2">
      <page-title>Hello, {{ name }}!</page-title>

      <p class="mt-6 max-w-4xl text-base lg:text-xl">
        Templatus-Stimulus is an opinionated template for web applications with
        <b>Ruby on Rails</b> and <b>Vue.js 3</b>
      </p>
    </div>

    <click-button
      :count="store.total"
      :enabled="store.loaded"
      @click="store.sendClick()"
    ></click-button>
  </div>

  <template v-if="store.items.length">
    <h2
      class="mt-8 text-xl font-medium tracking-wide text-center sm:text-left text-red-800 uppercase"
    >
      Latest clicks
    </h2>

    <click-list :clicks="store.items.slice(0, 5)"></click-list>
  </template>
</template>
