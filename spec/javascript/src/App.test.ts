import { mount } from '@vue/test-utils';

import App from '@/App.vue';

import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: { template: 'Home page' },
    },
    {
      path: '/about',
      component: { template: 'About page' },
    },
  ],
});

describe('App', () => {
  const wrapper = mount(App, {
    global: {
      plugins: [router],
    },
  });

  afterAll(() => {
    wrapper.unmount();
  });

  test('matches snapshot', () => {
    expect(wrapper.html()).toMatchSnapshot();
  });

  test('recognizes online/offline', async () => {
    window.dispatchEvent(new window.Event('offline'));
    await wrapper.vm.$nextTick();
    expect(wrapper.html()).toContain('offline');

    window.dispatchEvent(new window.Event('online'));
    await wrapper.vm.$nextTick();
    expect(wrapper.html()).not.toContain('offline');
  });
});
