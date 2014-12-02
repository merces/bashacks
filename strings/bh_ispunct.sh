bh_ispunct() {
   if $(isgraph "$1") 
   then 
      if ! $(isalnum "$1")
      then
         return 0
      fi
   else 
      return 1
   fi
   return 1
}
