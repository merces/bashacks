bh_rfc_dl() {
	wget $(echo "$@" | sed "s|[0-9]*|http://www.rfc-editor.org/pdfrfc/rfc&.txt.pdf|g" )
}
