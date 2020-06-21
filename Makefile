bad :=
bad += problematic.txt
bad += darius.txt
bad += ldnoobw.txt
bad += mauricebutler.txt
bad += reimertz.txt

count := 16384

all: words.txt

all.txt: count_1w.txt
	cat $< | cut -f 1 > $@

problematic.txt: all.txt
	egrep 'fuck|shit|damn|bitch|cumshot|porn' all.txt | sort > $@

bad.txt: $(bad)
	cat $(bad) | sort | uniq > $@

ok.txt: bad.txt all.txt clean.pl
	./clean.py bad.txt all.txt > $@

words.txt: ok.txt
	head -$(count) $< > $@

tidy:
	rm -f *~

clean: tidy
	rm -f all.txt
	rm -f bad.txt
	rm -f problematic.txt
	rm -f ok.txt
	rm -f words.txt
