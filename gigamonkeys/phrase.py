#!/usr/bin/env python3

import random


def load_words():
    with open("words.txt") as f:
        return [w[:-1] for w in f]


if __name__ == "__main__":

    import sys

    n = int(sys.argv[1])
    words = load_words()

    print(" ".join(random.choice(words) for i in range(n)))
