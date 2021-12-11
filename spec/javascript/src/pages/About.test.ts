import { mount } from '@vue/test-utils';
import About from '@/pages/About.vue';
import * as Vue from 'vue';

describe('About', () => {
  const savedVersion = Object.getOwnPropertyDescriptor(
    Vue,
    'version',
  ) as PropertyDescriptor;

  beforeAll(() => {
    // Mock `Vue.version` to have a stable snapshot
    Object.defineProperty(Vue, 'version', {
      value: '3.x.y',
    });
  });

  afterAll(() => {
    Object.defineProperty(Vue, 'version', savedVersion);
  });

  test('matches snapshot', () => {
    const wrapper = mount(About, {});

    expect(wrapper.html()).toMatchSnapshot();
  });
});
