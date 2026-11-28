#!/usr/bin/env python3
from __future__ import annotations

import sys
import unicodedata
from pathlib import Path

# Unicode Code Point Ranges
#
#   Unicode code point:        U+0000–U+10FFFF
#   Surrogate code point:      U+D800–U+DFFF
#   High-surrogate code point: U+D800–U+DBFF
#   Low-surrogate code point:  U+DC00–U+DFFF
#   Unicode scalar value:      U+0000–U+10FFFF excluding U+D800–U+DFFF (i.e. U+0000–U+D7FF and U+E000–U+10FFFF)
#
# Rust `String` and Python `str`
#
#   Rust `String` stores valid UTF-8, which can encode only Unicode scalar values, excluding surrogate code points.
#   Python `str` is a sequence of Unicode code points, including surrogate code points.
#
MIN_CODE_POINT = 0x0
MAX_CODE_POINT = 0x10ffff
MIN_SURROGATE = 0xd800
MAX_SURROGATE = 0xdfff


def print_usage() -> None:
    filename = Path(__file__).name
    print(f"usage: ./{filename} [<characters>...] [<code-points>...] [<character-name>...]", file=sys.stderr)


def is_code_point(code: int) -> bool:
    return MIN_CODE_POINT <= code <= MAX_CODE_POINT


def is_surrogate(code: int) -> bool:
    return MIN_SURROGATE <= code <= MAX_SURROGATE


def is_scalar_value(code: int) -> bool:
    return (
        is_code_point(code)
        and not is_surrogate(code)
    )


def is_char(char: str) -> bool:
    return isinstance(char, str) and len(char) == 1


def is_scalar(char: str) -> bool:
    return (
        is_char(char)
        and not is_surrogate(ord(char))
    )


def main() -> None:
    args = sys.argv[1:]
    if not args:
        print_usage()
        sys.exit(1)

    for arg in args:
        print(arg)


if __name__ == "__main__":
    main()
