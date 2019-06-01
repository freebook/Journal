DSSSL=/usr/local/opt/docbook-xsl/docbook-xsl/xhtml5/docbook.xsl
XSLTPROC=xsltproc

PREFIX=~/tmp/
#DATE=$(shell date --iso-8601)

#rm -rf $(PREFIX)/$@
${XSLTPROC} ${DSSSL} $1 > ${PREFIX}/$1.html