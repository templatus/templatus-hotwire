import { mount } from '@vue/test-utils';
import NotFound from '@/pages/NotFound.vue';

describe('NotFound', () => {
  test('matches snapshot', () => {
    const wrapper = mount(NotFound, {});

    expect(wrapper.html()).toMatchSnapshot();
  });
});
