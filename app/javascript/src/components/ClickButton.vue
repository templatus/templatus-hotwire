<script setup lang="ts">
import LoadingAnimation from '@/components/LoadingAnimation.vue';

defineProps({
  enabled: {
    type: Boolean,
    required: true,
  },
  count: {
    type: Number,
    required: true,
  },
});

const emit = defineEmits(['click']);

function onClick() {
  emit('click');
}
</script>

<template>
  <div class="flex flex-col mt-5 sm:mt-0 w-full sm:w-56 lg:-translate-y-72">
    <div id="counter" class="p-2 lg:p-5 text-center bg-white rounded-t shadow">
      <template v-if="enabled">
        <transition
          mode="out-in"
          enter-active-class="transition-transform duration-300 ease-out"
          enter-from-class="scale-0"
          enter-to-class="scale-100"
          leave-active-class="transition-transform duration-200 ease-in"
          leave-from-class="scale-100"
          leave-to-class="scale-0"
        >
          <div :key="count" class="text-5xl">
            {{ count.toLocaleString() }}
          </div>
        </transition>
        <div class="py-1 uppercase">Clicks</div>
      </template>
      <LoadingAnimation v-else class="w-full h-20"></LoadingAnimation>
    </div>

    <button
      type="button"
      class="py-2 px-4 w-full text-sm font-medium text-red-700 bg-red-100 hover:bg-red-200 rounded-b-md border border-red-200 focus:ring-2 focus:ring-red-500 focus:ring-offset-2 shadow focus:outline-none"
      @click="onClick()"
    >
      Click me!
    </button>

    <p class="hidden sm:block mt-5 text-sm text-gray-600">
      Tip: Open two browser windows in parallel and see what happens.
    </p>
  </div>
</template>
