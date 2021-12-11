<script setup lang="ts">
import { TabGroup, TabList, Tab } from '@headlessui/vue';
import GitVersion from '@/components/GitVersion.vue';
import { metaContent } from '@/utils/metaContent';
import useOnlineOffline from './use/online-offline';

const git: {
  commitVersion?: string;
  commitTime?: string;
} = {
  commitVersion: metaContent('git-commit-version'),
  commitTime: metaContent('git-commit-time'),
};

const tabs: {
  name: string;
  href: string;
}[] = [
  { name: 'Home', href: '/' },
  { name: 'About', href: '/about' },
];

const { online } = useOnlineOffline();
</script>

<template>
  <div class="flex flex-col min-h-screen bg-red-50">
    <header>
      <svg
        class="hidden sm:block absolute inset-0 w-full h-96 drop-shadow-xl"
        fill="none"
        preserveAspectRatio="none"
        viewBox="0 0 100 100"
      >
        <polygon
          fill="currentColor"
          class="text-red-800"
          points="0,0 0,100 100,0"
        />
      </svg>

      <div class="relative bg-red-800 sm:bg-transparent">
        <div class="py-8 sm:py-10 px-4 sm:px-6 lg:px-8 mx-auto max-w-5xl">
          <div class="flex items-center space-x-5 sm:space-x-10">
            <img
              :src="require('images/rails.svg')"
              alt="Ruby on Rails"
              class="p-3 bg-red-100 rounded"
              width="191"
              height="72"
            />

            <div class="text-4xl sm:text-8xl text-red-100">&plus;</div>

            <img
              :src="require('images/vue.svg')"
              alt="Vue.js 3"
              class="p-3 bg-red-100 rounded"
              width="83"
              height="72"
            />
          </div>

          <TabGroup class="mt-10">
            <TabList class="flex space-x-4" as="nav">
              <Tab v-for="tab in tabs" :key="tab.name" as="template">
                <router-link
                  :to="tab.href"
                  :class="[
                    tab.href == $route.path
                      ? 'bg-red-200 border border-red-200  text-red-900'
                      : 'bg-red-800 border border-red-200  text-red-200 hover:bg-red-300 hover:text-red-800',
                    'px-4 py-1 font-medium text-lg rounded-md',
                  ]"
                >
                  {{ tab.name }}
                </router-link>
              </Tab>
            </TabList>
          </TabGroup>
        </div>
      </div>
    </header>

    <main
      class="relative flex-grow sm:py-32 lg:py-24 px-4 sm:px-6 lg:px-8 pt-10 pb-24 mx-auto w-full max-w-5xl bg-transparent"
    >
      <router-view />
    </main>

    <footer
      class="fixed bottom-0 pt-2 pb-4 w-full text-sm text-white bg-gray-700"
    >
      <div class="flex flex-wrap px-4 sm:px-6 lg:px-8 mx-auto max-w-5xl">
        <div class="w-full sm:w-1/4 text-center sm:text-left">
          <a
            class="hover:underline"
            target="_blank"
            rel="noopener noreferrer"
            href="https://github.com/ledermann/templatus"
          >
            Source on GitHub
          </a>
        </div>

        <div class="w-full sm:w-1/4 text-center">
          <span
            v-if="!online"
            class="py-px px-1 font-bold tracking-wide text-red-700 uppercase bg-white rounded"
            >You are offline</span
          >
        </div>

        <div class="w-full sm:w-1/2 text-center sm:text-right">
          <git-version
            v-if="git.commitTime && git.commitVersion"
            :commit-time="git.commitTime"
            :commit-version="git.commitVersion"
          ></git-version>
        </div>
      </div>
    </footer>
  </div>
</template>
