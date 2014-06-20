DSSSL=../docbook-xsl/article.xsl
XSLTPROC=xsltproc

PUBLIC_HTML=~/public_html
PREFIX=$(PUBLIC_HTML)/journal

HTML := $(patsubst %.xml,%.html,$(wildcard *.xml))

all: $(HTML)

%.html: %.xml
	@rm -rf $(PREFIX)/$@
	@$(XSLTPROC) $(DSSSL) $< >  $(PREFIX)/$@

clean:
	@rm -rf $(PREFIX)/*.html
	@mkdir -p $(PREFIX)
	@cp ../common/journal.css $(PREFIX)

rebuild : clean all
