function fancies {
	COMSPATH=/home/avtzis/.zsh/fancies/commands
  NUMOFCOMS=`cat $COMSPATH | wc -l`
  WHICHCOM=$((RANDOM%$NUMOFCOMS+1))
  THISCOM=`cat $COMSPATH | sed $WHICHCOM'q;d'`

  while getopts a:fr opt; do
  	case "$opt" in
  		a) echo "$OPTARG" >> $COMSPATH
  			 return 0;;
			f) #echo $THISCOM
			   eval "$THISCOM"
				 return 0;;
			r) echo "$WHICHCOM/$NUMOFCOMS   $THISCOM"
			   return 0;;
  		?) echo "";;
		esac
  done
  
  cat $COMSPATH
}

alias fancy='fancies -f'
