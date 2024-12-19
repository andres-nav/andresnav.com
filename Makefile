.PHONY: run
run:
	hugo server --noHTTPCache -w

.PHONY: all
all: run
