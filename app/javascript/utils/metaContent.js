export function metaContent(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`);

  if (element) return element.content;
}
