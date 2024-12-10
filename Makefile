.PHONY: run
run:
	firefox localhost:1313
	hugo server

.PHONY: all
all: run
