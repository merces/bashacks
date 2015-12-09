bh_isascii() {
   local c2d=$(bh_asc2dec "1")

   if $(bh_isdigit $c2d)
   then
      [ $c2d -lt 127 \
         -a $c2d -gt 0 ] &&
         return 0 ||
         return 1
   fi
   return 1
}
