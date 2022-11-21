export function metaContent(name: string): string | undefined {
  const element = document.head.querySelector(
    `meta[name="${name}"]`,
  ) as HTMLMetaElement;

  if (element) return element.content;
}
