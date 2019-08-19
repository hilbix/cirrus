# This Works is placed under the terms of the Copyright Less License,
# see file COPYRIGHT.CLL.  USE AT OWN RISK, ABSOLUTELY NO WARRANTY.

.PHONY:	love
love:	all

.PHONY:	all
all:
	bin/update-readme.sh README.md

