#!/bin/bash

if [[ "$1" == "" || "$1" == "-h" || "$1" == "--help" ]];
then
 echo "nmap-evasion, by FabioDefilippoSoftware"
 echo "arg1=IPtraget"
 echo "arg2=Traget Port number (example 80)"
 echo "arg3=Time to Live value (example 30)"
 echo "arg4=Time to sleep in seconds (example 5)"
 echo "arg5=Source port (example 80)"
else
 if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]];
 then
  if [[ "$2" =~ ^[0-9]+$ ]];
  then
   if [[ "$3" =~ ^[0-9]+$ ]];
   then
    if [[ "$4" =~ ^[0-9]+$ ]];
    then
     if [[ "$5" =~ ^[0-9]+$ ]];
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
      for FLAGS in $(seq 0 255)
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
             for G in "" " -g $5"
             do
             for T in "" " --ttl $3"
             do
              for B in " --badsum" ""
               do
                RSP=$(nmap -Pn --scanflags 0x$(printf '%02x' "$FLAGS") $P$O$S$H$VI$F$M$D$G$T$B "$TRG")
                if [[ "$RSP" == *"open"* ]];
                then
                 echo "nmap -Pn --scanflags 0x$(printf '%02x' $FLAGS) $P$O$S$H$VI$F$M$D$G$T$B $TRG"
                fi
                sleep $4
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
      echo "ERROR: invalid source port number"
     fi
    else
     echo "ERROR: invalid seconds number"
    fi
   else
    echo "ERROR: invalid Time To Live"
   fi
  fi
 else
  echo "ERROR: invalid ip target"
 fi
fi
