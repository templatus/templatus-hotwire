const mockGet = jest.fn().mockResolvedValue({
  json: {
    total: 500,
    items: [
      {
        id: 1,
        created_at: '1990-12-25',
        ip: '1.2.3.4',
        user_agent: 'World Wide Web',
      },
      {
        id: 2,
        created_at: '1994-12-15',
        ip: '5.6.7.8',
        user_agent: 'Netscape Navigator',
      },
    ],
  },
});

const mockPost = jest.fn().mockResolvedValue(43);

jest.mock('@rails/request.js', () => ({
  __esModule: true,
  get: mockGet,
  post: mockPost,
}));

import { setActivePinia, createPinia } from 'pinia';
import { useClickStore } from '@/stores/click';

describe('CounterStore', () => {
  beforeEach(() => setActivePinia(createPinia()));

  it('can send click', async () => {
    const store = useClickStore();
    await store.sendClick();

    expect(mockPost).toHaveBeenCalled();
  });

  it('can get clicks', async () => {
    const store = useClickStore();
    await store.getClicks();

    expect(store.total).toEqual(500);
  });

  it('can subscribe', () => {
    const store = useClickStore();
    store.subscribe();
    expect(store.subscribed).toEqual(true);
  });

  it('can unsubscribe', () => {
    const store = useClickStore();
    store.unsubscribe();
    expect(store.subscribed).toEqual(false);
  });
});
