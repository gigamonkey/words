#!/usr/bin/env python

import sys

bad_words = sys.argv[1]
all_words = sys.argv[2]

vowels = set("aeiou")


def ok(word):
    return word not in bad and len(word) >= 4 and len(word) <= 8 and vowels & set(word)


with open(bad_words) as f:
    bad = {line[:-1] for line in f}

with open(all_words) as f:
    for line in f:
        word = line[:-1]
        if ok(word):
            print(word)
