DSSSL=/usr/local/opt/docbook-xsl/docbook-xsl/xhtml5/docbook.xsl
XSLTPROC=xsltproc

PREFIX=~/tmp/
#DATE=$(shell date --iso-8601)

#rm -rf $(PREFIX)/$@
${XSLTPROC} --stringparam section.autolabel 1 \
	--stringparam toc.section.depth 5 \
	${DSSSL} $1 > ${PREFIX}/$1.html