.PHONY: run
run:
	firefox localhost:1313
	hugo server --noHTTPCache -w

.PHONY: all
all: run
