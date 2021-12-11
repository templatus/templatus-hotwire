const mockSendClick = jest.fn();
const mockUnsubscribe = jest.fn();
const mockGetClicks = jest.fn();
const mockSubscribe = jest.fn();

jest.mock('@/stores/click', () => ({
  __esModule: true,
  useClickStore: () => ({
    loaded: true,
    total: 42,
    items: [
      {
        created_at: '2021-05-23T09:27:21.497Z',
        ip: '1.2.3.4',
        user_agent: 'Jest',
      },
    ],
    getClicks: mockGetClicks,
    subscribe: mockSubscribe,
    unsubscribe: mockUnsubscribe,
    sendClick: mockSendClick,
  }),
}));

import { mount } from '@vue/test-utils';
import Home from '@/pages/Home.vue';

describe('Home', () => {
  const wrapper = mount(Home, {
    props: {
      name: 'World',
    },
  });

  test('load clicks and subscribes', () => {
    expect(mockSubscribe).toHaveBeenCalled();
    expect(mockGetClicks).toHaveBeenCalled();
  });

  test('renders name', () => {
    const title = wrapper.find('h1')?.element?.textContent?.trim();
    expect(title).toEqual('Hello, World!');
  });

  test('matches snapshot', () => {
    expect(wrapper.html()).toMatchSnapshot();
  });

  test('executes sendClick', () => {
    const button = wrapper.find('button');
    button.trigger('click');

    expect(mockSendClick).toHaveBeenCalled();
  });

  test('unsubscribes on unmount', () => {
    wrapper.unmount();
    expect(mockUnsubscribe).toHaveBeenCalled();
  });
});
