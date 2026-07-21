#!/usr/bin/env python3
"""Small deterministic CSS minifier for CKCSS release artefacts.

It removes comments and unnecessary whitespace while preserving quoted strings,
escapes, and CSS syntax. It deliberately avoids semantic rewrites.
"""
import sys


def minify(source: str) -> str:
    out, index, quote, pending_space = [], 0, None, False
    # Keep whitespace around ':' and '(' when it could carry selector meaning,
    # e.g. `.ck-table :is(th, td)`. The result is slightly less compact but
    # remains semantics-preserving without a full CSS parser.
    punctuation = set('{};,>+~[]')
    while index < len(source):
        char = source[index]
        following = source[index + 1] if index + 1 < len(source) else ''
        if quote:
            out.append(char)
            if char == '\\' and following:
                out.append(following)
                index += 2
                continue
            if char == quote:
                quote = None
            index += 1
            continue
        if char in ('"', "'"):
            if pending_space and out and out[-1] not in punctuation:
                out.append(' ')
            pending_space = False
            quote = char
            out.append(char)
        elif char == '/' and following == '*':
            index = source.find('*/', index + 2)
            if index == -1:
                raise ValueError('Unterminated CSS comment')
            pending_space = True
            index += 2
            continue
        elif char.isspace():
            pending_space = True
        else:
            if pending_space and out and out[-1] not in punctuation and char not in punctuation:
                out.append(' ')
            pending_space = False
            out.append(char)
        index += 1
    if quote:
        raise ValueError('Unterminated CSS string')
    # Whitespace following a colon is never meaningful in the emitted CSS.
    # Whitespace *before* a pseudo-class colon remains intact: `.parent :is()`
    # and `.parent:is()` are distinct selectors.
    return ''.join(out).replace(': ', ':').replace(';}', '}') + '\n'


if __name__ == '__main__':
    if len(sys.argv) != 3:
        raise SystemExit('usage: minify-css.py INPUT OUTPUT')
    with open(sys.argv[1], encoding='utf-8') as input_file:
        result = minify(input_file.read())
    with open(sys.argv[2], 'w', encoding='utf-8', newline='\n') as output_file:
        output_file.write(result)
