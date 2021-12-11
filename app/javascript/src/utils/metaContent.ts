export function metaContent(name: string): string | undefined {
  const element: HTMLMetaElement | null = document.head.querySelector(
    `meta[name="${name}"]`,
  );

  if (element) return element.content;
}
