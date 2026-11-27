#!/usr/bin/env python3
from __future__ import annotations

import unicodedata

code = 0x0394
print(f"| {chr(code)} | U+{code:04X} | {unicodedata.name(chr(code))} |")

char = 'Δ'
print(f"| {char} | U+{ord(char):04X} | {unicodedata.name(char)} |")

name = "GREEK CAPITAL LETTER DELTA"
char = unicodedata.lookup(name)
print(f"| {char} | U+{ord(char):04X} | {name} |")
