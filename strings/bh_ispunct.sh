bh_ispunct() {
   if $(bh_isgraph "$1") 
   then 
      if ! $(bh_isalnum "$1")
      then
         return 0
      fi
   else 
      return 1
   fi
   return 1
}
