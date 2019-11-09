#!/bin/bash

lgreen="\e[92m"
lred="\e[91m"
nc="\e[39m"
enablemacchanger=0
usetor=0

clear

while :
do
clear
echo -e $lred""
cat << "EOF"
 /$$$$$$$                        /$$                               /$$$$$$                      /$$   /$$              
| $$__  $$                      | $$                              |_  $$_/                     |__/  | $$              
| $$  \ $$ /$$   /$$  /$$$$$$$ /$$$$$$   /$$   /$$  /$$$$$$$        | $$   /$$$$$$$  /$$    /$$ /$$ /$$$$$$    /$$$$$$ 
| $$$$$$$/| $$  | $$ /$$_____/|_  $$_/  | $$  | $$ /$$_____/        | $$  | $$__  $$|  $$  /$$/| $$|_  $$_/   /$$__  $$
| $$__  $$| $$  | $$|  $$$$$$   | $$    | $$  | $$|  $$$$$$         | $$  | $$  \ $$ \  $$/$$/ | $$  | $$    | $$$$$$$$
| $$  \ $$| $$  | $$ \____  $$  | $$ /$$| $$  | $$ \____  $$        | $$  | $$  | $$  \  $$$/  | $$  | $$ /$$| $$_____/
| $$  | $$|  $$$$$$/ /$$$$$$$/  |  $$$$/|  $$$$$$$ /$$$$$$$/       /$$$$$$| $$  | $$   \  $/   | $$  |  $$$$/|  $$$$$$$
|__/  |__/ \______/ |_______/    \___/   \____  $$|_______/       |______/|__/  |__/    \_/    |__/   \___/   \_______/
                                         /$$  | $$                                                                     
                                        |  $$$$$$/                                                                     
                                         \______/ 
EOF
echo -e $lgreen""
cat << "EOF"                                                                     
 /$$$$$$$$                        /$$$$$$$  /$$                                               /$$                      
| $$_____/                       | $$__  $$|__/                                              | $$                      
| $$     /$$$$$$   /$$$$$$       | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$                      
| $$$$$ /$$__  $$ /$$__  $$      | $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$ /$$__  $$                      
| $$__/| $$  \ $$| $$  \__/      | $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/| $$  | $$                      
| $$   | $$  | $$| $$            | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$      | $$  | $$                      
| $$   |  $$$$$$/| $$            | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$      |  $$$$$$$                      
|__/    \______/ |__/            |_______/ |__/|_______/  \_______/ \______/ |__/       \_______/                                                                                                                                        
EOF
echo -e $nc""
echo "You have been invited to Rustys Server"
echo "macchanger = $enablemacchanger"
echo "proxys = $usetor"
echo ""
echo ""
echo "1) Finder"
echo ""
echo "2) BruteForce (can be faster than finder)"
echo ""
echo "3) Enable mac changer (recommended)"
echo ""
echo "4) Enable tor (to not get your ip banned on the api)"
echo ""
echo "e) exit"
echo ""
read -p "-->> " menu1
if [[ $menu1 == "1" ]]; then
  clear
  echo -e $lgreen"You have run Finder"
  echo ""
  echo "Starting..."
  echo -e $lred"Press ctrl+c to quit!!!"
  sleep 3
  echo -e $nc""
  echo "starting..."
  echo "might take a while"
  if [[ $usetor == "0" ]]; then
    echo ""
  else
    anonym8 start &> /dev/null
  fi
  count="0"
  while :
  do
    sleep 0.5
    if [[ $enablemacchanger == "0" ]]; then
      echo ""
    else
      ifconfig wlan0 down
      macchanger -r wlan0
      ifconfig wlan0 up
    fi
    if [[ $usetor == "0" ]]; then
      echo ""
    else
      if [[ $count == "10" ]]; then
        anonym8 change &> /dev/null
        count=$(count=0)
      fi
    fi
      for invite in `cat /dev/urandom | tr -dc 'A-Z-a-z-0-9' | fold -w 6 | head -n 1`; do
        echo -e $nc"starting..."
        check=$(wget "https://discordapp.com/api/v7/invite/$invite")
        let "count=count+1"
        if [[ -f $invite ]]; then
         echo -e $lgreen"working link\n"
          if [ -f "WorkingLinks.txt" ]; then
             echo "$invite" >> WorkingLinks.txt
             rm -r $invite
          else
            > WorkingLinks.txt
             echo "$invite" >> WorkingLinks.txt
             rm -r $invite
           fi
         else
           echo -e $lred"not a working link\n"
        fi
      done
  done
  clear
  echo "Finnished Scan!"
fi
if [[ $menu1 == "2" ]]; then
  clear
  echo -e $lgreen"You have run Bruteforce"
  echo ""
  echo "what is the name of your text file"
  echo ""
  read -p "-->> " wordli
  text2=".txt"
  wordlist="$wordli$text2"
  if [ -f "$wordlist" ]; then
    echo "$wordlist Found!"
    sleep 1
  else 
    echo "Can not find the wordlist making one for you..."
    echo "make shure to edit this list with the invite links"
    sleep 5
    > wordlist.txt
  fi
  echo "starting exploit"
  echo ""
  echo "might take a while"
  if [[ $usetor == "0" ]]; then
    echo ""
  else
    anonym8 start &> /dev/null
  fi
  count="0"
  while :
  do
    sleep 0.5
    if [[ $enablemacchanger == "0" ]]; then
      echo ""
    else
      ifconfig wlan0 down
      macchanger -r wlan0
      ifconfig wlan0 up
    fi
    if [[ $usetor == "0" ]]; then
      echo ""
    else
      if [[ $count == "10" ]]; then
        anonym8 change &> /dev/null
        count=$(count=0)
      fi
    fi
    for invite in `cat $wordlist`; do
      echo -e $nc"starting..."
      check=$(wget "https://discordapp.com/api/v7/invite/$invite")
      let "count=count+1"
      if [[ -f $invite ]]; then
       echo -e $lgreen"working link\n"
        if [ -f "WorkingLinks.txt" ]; then
          echo "https://discord.gg/$invite" >> WorkingLinks.txt
          rm -r $invite
        else
          > WorkingLinks.txt
          echo "https://discord.gg/$invite" >> WorkingLinks.txt
          rm -r $invite
        fi
      else
        echo -e $lred"not a working link\n"
      fi
    done
  done
  clear
  echo "Finnished Scan!"
fi
if [[ $menu1 == "3" ]]; then
  echo -e $lgreen"enabling"
  echo "This can only be used on wlan0"
  echo "It will be fixed soon"
  echo ""
  enablemacchanger="1"
fi
if [[ $menu1 == "4" ]]; then
  echo -e $lgreen"enableing"
  echo "Tor can be really slow just saying"
  echo "faster vertion coming soon"
  echo ""
  usetor="1"
fi
if [[ $menu1 == "e" ]]; then
  echo -e $lgreen"Aight bet"
  echo -e $lgreen"cya soon"
  exit 0
fi
done