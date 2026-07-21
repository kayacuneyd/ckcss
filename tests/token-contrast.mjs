const pairs = [
  ['light body text', '#18263b', '#f7f3ea', 4.5],
  ['light primary action', '#fdfbf6', '#225a9b', 4.5],
  ['light success text', '#3f6e47', '#dcebdf', 4.5],
  ['light warning text', '#805610', '#f6e5bc', 4.5],
  ['light danger text', '#a53526', '#f7dbd5', 4.5],
  ['dark body text', '#f7f3ea', '#13243a', 4.5],
  ['dark primary action', '#13243a', '#78b7e6', 4.5],
  ['dark success text', '#9acb9d', '#1d4935', 4.5],
  ['dark warning text', '#f0c978', '#5a421a', 4.5],
  ['dark danger text', '#ef9a8d', '#6a2f2b', 4.5]
];

function luminance(hex) {
  const channels = hex.slice(1).match(/../g).map((part) => Number.parseInt(part, 16) / 255);
  const linear = channels.map((value) => value <= 0.04045 ? value / 12.92 : ((value + 0.055) / 1.055) ** 2.4);
  return 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2];
}

for (const [name, foreground, background, minimum] of pairs) {
  const ratio = (Math.max(luminance(foreground), luminance(background)) + 0.05) /
    (Math.min(luminance(foreground), luminance(background)) + 0.05);
  if (ratio < minimum) throw new Error(`${name}: ${ratio.toFixed(2)}:1 is below ${minimum}:1`);
  console.log(`${name}: ${ratio.toFixed(2)}:1`);
}
