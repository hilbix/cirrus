#

.PHONY:	love
love:	all

.PHONY:	all
all:	README.md submodules status

.PHONY:	status
status:
	git status --porcelain

README.md:	Makefile | porcelain
	us="`git config --local --get remote.origin.url`" &&		\
	na="`expr match "$$us" '^.*/\([^:/]*\)\(\.git\)\?$$'`" &&	\
	us="`expr match "$$us" '^.*[:/]\([^:/]*\)/[^/]*/\?$$'`" &&	\
	br="`git rev-parse --abbrev-ref HEAD`" &&			\
	{ echo "[![$$br status](https://api.cirrus-ci.com/github/$$us/$$na.svg?branch=$$br)](https://cirrus-ci.com/github/$$us/$$na/$$br)"; echo; echo "# branch $$br"; echo; } > '$@'
	git add '$@'

.PHONY:	porcelain
porcelain:
	st="`git status --porcelain`" && test -z "$$st"

.PHONY:	submodules
submodules:	porcelain master

.PHONY:	master
master:	porcelain
	git submodule update --init '$@'
	cd '$@' && git checkout '$@' && git pull
	git add '$@'

