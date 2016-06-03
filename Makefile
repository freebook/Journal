DSSSL=../docbook-xsl/article.xsl
XSLTPROC=xsltproc

PUBLIC_HTML=~/public_html
PREFIX=$(PUBLIC_HTML)/journal
DATE=$(shell date --iso-8601)
HTML := $(patsubst %.xml,%.html,$(wildcard *.xml))

all: $(HTML)

%.html: %.xml
	@rm -rf $(PREFIX)/$@
	@$(XSLTPROC) $(DSSSL) $< >  $(PREFIX)/$@
	@sed -i "s#\$$Date#$(DATE)#g" $(PREFIX)/$@
	@sed -i "s#\$$<#<#g" $(PREFIX)/$@
	@$(shell test -d images && rsync -auv images $(PREFIX)/)

clean:
	@rm -rf $(PREFIX)/*.html
	@mkdir -p $(PREFIX)
	@cp ../common/journal.css $(PREFIX)

rebuild : clean all
