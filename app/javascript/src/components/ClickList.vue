<script setup lang="ts">
import { PropType } from 'vue';
import { Click } from '@/stores/click';

defineProps({
  clicks: {
    type: Array as PropType<Array<Click>>,
    required: true,
  },
});
</script>

<template>
  <transition-group
    tag="ul"
    class="relative"
    enter-active-class="transition-all duration-500 ease-out"
    enter-from-class="opacity-0 scale-y-50"
    enter-to-class="opacity-100 scale-y-100"
    leave-active-class="transition-all duration-500 ease-out"
    leave-from-class="opacity-100 scale-y-100 absolute"
    leave-to-class="opacity-0 scale-y-0 absolute"
    move-class="duration-500 ease-out"
  >
    <li
      v-for="click in clicks"
      :key="click.id"
      class="p-2 mt-2 bg-red-100 rounded"
    >
      <p>
        <span class="px-1 font-mono text-red-100 bg-gray-900 rounded">
          {{ click.ip }}
        </span>

        <span class="px-1 ml-2 text-sm sm:text-base font-medium text-gray-900">
          {{ new Date(Date.parse(click.created_at)).toUTCString() }}
        </span>
      </p>

      <p class="font-extralight text-gray-900">
        {{ click.user_agent }}
      </p>
    </li>
  </transition-group>
</template>
