.PHONY: clean tidy

autoflake := autoflake --in-place --recursive --remove-unused-variables --expand-star-imports --remove-all-unused-imports
black := black --line-length 100

bad :=
bad += problematic.txt
bad += darius.txt
bad += ldnoobw.txt
bad += mauricebutler.txt
bad += reimertz.txt

count := 16384

all: words.txt

all.txt: count_1w.txt
	cat $< | sort -k 2nr | cut -f 1 > $@

problematic.txt: all.txt problematic-patterns.txt
	egrep -f problematic-patterns.txt all.txt | sort > $@

bad.txt: $(bad)
	cat $(bad) | sort | uniq > $@

ok.txt: bad.txt all.txt gigamonkeys/clean.py
	./gigamonkeys/clean.py bad.txt all.txt > $@

words.txt: ok.txt
	head -$(count) $< > $@

fmt:
	$(autoflake) .
	isort .
	$(black) .

tidy:
	rm -f *~
	rm -f all.txt
	rm -f bad.txt
	rm -f problematic.txt
	rm -f ok.txt

clean: tidy
	rm -f words.txt
