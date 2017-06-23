bh_fileinfo()
{
  local dir=false
  local link=false

	[ -d "$1" ] && dir=true
	[ -L "$1" ] && link=true

  stat "$1" | sed '/Birth: \-/d'
  local inode=$(ls -di "$1" | cut -d' ' -f1)
  local fs=$(df --output=source "$1" | grep  '^/')
  PAGER=cat sudo -E debugfs -R "stat <$inode>" "$fs" 2>/dev/null | grep -F crtime | sed 's/crtime/ Birth/'
  echo "Source: $fs"
  $dir && return
  $link || echo '   Ext:' $(lsattr "$1"| cut -d' ' -f1)
  echo '  Mime:' $(file -i "$1" | cut -d: -f2)
  echo 'Header:' $(hd -n16 "$1" | sed -n 's/^00000000  \(.*|\).*$/\1/1p')
}
