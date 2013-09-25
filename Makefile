DSSSL=../docbook-xsl/article.xsl
XSLTPROC=xsltproc --stringparam html.stylesheet journal.css \
        --stringparam toc.section.depth 5 \
        --stringparam section.autolabel 1 \
        --stringparam css.decoration 1

PUBLIC_HTML=~/public_html
PREFIX=$(PUBLIC_HTML)/journal

HTML := $(patsubst %.xml,%.html,$(wildcard *.xml))

all: $(HTML)

%.html: %.xml
	@$(XSLTPROC) $(DSSSL) $< >  $(PREFIX)/$@

clean:
	@rm -rf $(PREFIX)/*.html
	@mkdir -p $(PREFIX)
	@cp ../common/journal.css $(PREFIX)

rebuild : clean all