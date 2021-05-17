# Words

An attempt to make a reasonably clean list of words for whenever you
need to generate random words (e.g. correct horse battery staple style
pass phrases) and don't want to use offensive language. The list is
built starting from the Natural Language Corpus Data put together by
Peter Norvig from the Google Web Trillion Word Corpus and then
removing many problematic words.

Due to the nature of this way of building the list, this repo itself
unfortunately contains several files containing many bad words
collected from various places on the internet. See `sources.yaml` for
details. Do not open these files if you do not wish to see many
potentially offensive words.

To use run:

```
pipenv install --dev
pipenv shell
make
```

This will produce two useful files `ok.txt` which is all the words
from the 1/3 million most frequently occuring words from the Google
corpus minus the bad words and `words.txt` which contains the 16,384
(i.e. 2**14) most frequently occuring words. You can change the
`count` variable in the `Makefile` to change the number of words in
`words.txt`.

If you find a word in `ok.txt` that you think someone might find
offensive, feel free to let me know so I can filter it and related
words out. If you want to argue that I've filtered out something that
isn't actually that bad, I probably won't care; this is a better safe
than sorry collection. `ok.txt` has 208,058 in it so it's not like
we're going to run out.
