<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from 'vue';
import * as timeago from 'timeago.js';

defineProps({
  commitVersion: {
    type: String,
    required: true,
  },

  commitTime: {
    type: String,
    required: true,
  },
});

const timeElement = ref();

onMounted(() => {
  timeago.render(timeElement.value);
});

onBeforeUnmount(() => {
  timeago.cancel();
});
</script>

<template>
  <div>
    <code>{{ commitVersion }}</code>
    <b class="ml-3"><time ref="timeElement" :datetime="commitTime"></time></b>
  </div>
</template>
