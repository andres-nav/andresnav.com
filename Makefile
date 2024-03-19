PORT=1313
URL=http://localhost:$(PORT)

.PHONY: all clean serve browser

all: server

clean:
	@rm -rf public/

browser:
	@firefox "$(URL)"

server: browser
	@hugo server --noHTTPCache --disableFastRender --buildDrafts --buildFuture --port $(PORT)
