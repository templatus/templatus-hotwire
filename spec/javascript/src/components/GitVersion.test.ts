import { mount } from '@vue/test-utils';
import GitVersion from '@/components/GitVersion.vue';

describe('GitVersion', () => {
  test('matches snapshot', () => {
    const wrapper = mount(GitVersion, {
      props: {
        commitVersion: 'v0.0.1-123-7654321',
        commitTime: '2021-06-01T12:00:00+02:00',
      },
    });

    expect(wrapper.html()).toMatchSnapshot();

    wrapper.unmount();
  });
});
