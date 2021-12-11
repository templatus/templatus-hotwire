import { metaContent } from '@/utils/metaContent';

describe('metaContent', () => {
  beforeAll(() => {
    document.head.innerHTML = '<meta name="the-name" content="the-content">';
  });

  test('returns content when exists', () => {
    expect(metaContent('the-name')).toEqual('the-content');
  });

  test('returns undefined when missing', () => {
    expect(metaContent('this-does-not-exist')).toBeUndefined();
  });
});
