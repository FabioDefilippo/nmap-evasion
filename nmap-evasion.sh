#!/bin/bash
if [[ "$1" == "" || "$1" == "-h" || "$1" == "--help" ]];
then
 echo "nmap-evasion, by FabioDefilippoSoftware"
 echo "argv[0]=IPtraget"
 echo "argv[1]=Port number (example 80)"
 echo "argv[2]=Time to Live value (example 30)"
 echo "argv[3]=-v (verbose mode)"
else
 if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]];
 then
   if [[ "$3" =~ ^[0-9]+$ ]];
   then
    TRG=""
    if [[ -f "$1" ]];
    then
     TRG=" -iL $1"
    else
     TRG="$1"
    fi
    P=" -p 80"
    if [[ "$2" != "" ]];
    then
     P="-p $2"
    fi
    for S in " -sT" " -sS" " -sA" " -sW" " -sM" " -sU" " -sN" " -sF" " -sX" " -sC" " -sY" " -sZ" " -sO" " -b"
    do
     for H in "" " -PE" " -PP" " -PM"
     do
      for (( I=0 ; I<10 ; I++ ));
      do
       VI=" --version-intensity $I"
       for O in "" " -O" " --osscan-limit" " --osscan-guess" " -A"
       do
        for F in "" " -f" " -ff"
        do
         for M in "" " --mtu 8" " --mtu 16" " --mtu 24" " --mtu 32" " --mtu 40" " --mtu 48" " --mtu 56" " --mtu 64"
         do
          for D in "" " -D RND:1,ME,RND:1" " -D ME,RND:2" " -S RND:2,ME"
          do
           for G in "" " -g 80"
	   do
	    for T in "" " --ttl $3"
	    do
             for B in " --badsum" ""
             do
              if [[ "$4" == "-v" ]];
              then
               echo "nmap $P$O$S$H$VI$F$M$D$G$T$B $TRG"
              fi
		RES=$(nmap -v --reason -Pn $P$O$S$H$VI$F$M$D$G$T$B $TRG)
		sleep 15
              if [[ "$RES" == *"open"* ]];
              then
               echo "port open found!"
               echo "nmap -v --reason --open -Pn $P$O$S$H$VI$F$M$D$G$T$B $TRG"
              elif [[ "$RES" == *"closed"* ]];
              then
               echo "port closed found!"
               echo "nmap -v --reason --open -Pn $P$O$S$H$VI$F$M$D$G$T$B $TRG"
              fi
             done
            done
           done
          done
         done
        done
       done
      done
     done
    done
   for SA in " -sS" " -sT" " -sA" " -sW" " -sM" " -sU" " -sN" " -sF" " -sX" " -sC" " -sY" " -sZ" " -sO" " -b"
   do
    for HA in "" " -PE" " -PP" " -PM"
    do
     for (( IA=0 ; IA<10 ; IA++ ));
     do
      VIA=" --version-intensity $I"
      for OA in "" " -O" " --osscan-limit" " --osscan-guess" " -A"
      do
       for FA in "" " -f"
       do
        for MA in "" " --mtu 8" " --mtu 16" " --mtu 24" " --mtu 32" " --mtu 40" " --mtu 48" " --mtu 56" " --mtu 64"
        do
         for DA in "" " -D RND:1,ME,RND:1" " -D ME,RND:2" " -S RND:2,ME"
         do
          for GA in "" " -g 80"
          do
           for TA in "" " --ttl $3"
           do
            for BA in ""
            do
             for SB in " -sS" " -sT" " -sA" " -sW" " -sM" " -sU" " -sN" " -sF" " -sX" " -sC" " -sY" " -sZ" " -sO" " -b"
             do
              for HB in "" " -PE" " -PP" " -PM"
              do
               for (( IB=0 ; IB<10 ; IB++ ));
               do
                VIB=" --version-intensity $I"
                for OB in "" " -O" " --osscan-limit" " --osscan-guess" " -A"
                do
                 for FB in "" " -f" " -ff"
                 do
                  for MB in "" " --mtu 8" " --mtu 16" " --mtu 24" " --mtu 32" " --mtu 40" " --mtu 48" " --mtu 56" " --mtu 64"
                  do
                   for DB in "" " -D RND:1,ME,RND:1" " -D ME,RND:2" " -S RND:2,ME"
                   do
                    for GB in "" " -g 80"
                    do
                     for TB in "" " --ttl $3"
                      do
                       for BB in " --badsum" ""
                       do
                        if [[ "$4" == "-v" ]];
                        then
                         echo "nmap -v --reason $PB$OB$SB$HB$VIB$FB$MB$DB$GB$TB$BB -Pn $TRG; nmap -v --reason --open $PA$OA$SA$HA$VIA$FA$MA$DA$GA$TA$BA -Pn $TRG"
                        fi
                        nmap $PB$OB$SB$HB$VIB$FB$MB$DB$GB$TB$BB -Pn $TRG; RES=$(nmap -v --reason $PA$OA$SA$HA$VIA$FA$MA$DA$GA$TA$BA -Pn $TRG)
                        if [[ "$RES" == *"open"* ]];
                        then
                         echo "port open found!"
                         echo "nmap -v --reason $PB$OB$SB$HB$VIB$FB$MB$DB$GB$TB$BB -Pn $TRG; nmap -v --reason --open $PA$OA$SA$HA$VIA$FA$MA$DA$GA$TA$BA -Pn $TRG"
                        elif [[ "$RES" == *"closed"* ]];
                        then
                         echo "port closed found!"
                         echo "nmap -v --reason $PB$OB$SB$HB$VIB$FB$MB$DB$GB$TB$BB -Pn $TRG; nmap -v --reason --open $PA$OA$SA$HA$VIA$FA$MA$DA$GA$TA$BA -Pn $TRG"
                        fi
                       done
                      done
                     done
                    done
                   done
                  done
                 done
                done
               done
              done
             done
            done
           done
          done
         done
        done
       done
      done
     done
    done
   else
    echo "nmap-evasion, by FabioDefilippoSoftware"
    echo "Invalid Time to Live value"
   fi
 else
  echo "nmap-evasion, by FabioDefilippoSoftware"
  echo "invalid IP-target"
 fi
fi
