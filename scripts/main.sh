#!/usr/bin/env bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
OK='\033[0;32m●\033[0m'
KO='\033[0;31m●\033[0m'
NS='\033[0;33m●\033[0m' # not sure
logs="./logs.txt"


if [ -f $logs ]; then
  rm $logs;
fi

# echo "[ ] Updating APT" | tee >> $logs
# sudo apt update -y >> $logs
# echo -e "\e[1A\e[K[${GREEN}O${NC}] Updating APT"
# echo "[ ] Upgrading APT" | tee >> $logs
# sudo apt full-upgrade -y >> $logs
# echo -e "\e[1A\e[K[${GREEN}O${NC}] Upgrading APT"
# echo "[ ] Fixing APT" | tee >> $logs
# sudo apt -y --fix-broken install >> $logs
# echo -e "\e[1A\e[K[${GREEN}O${NC}] Fixing APT"
# echo 

init(){
  echo "[Verifications]"
  snap --version >> $logs
if [ $? -eq 0 ];then
    echo -e " \t [$OK] snap is installed"
else
    echo -e " \t [ ] Installing snap"
    apt-get install snapd -y >> $logs
    if [ $? -eq 0 ];then
        echo -e " \t \e[1A\e[K[$OK] Installed snap\r"
    else
        echo -e " \t \e[1A\e[K[$KO] Issue see $logs\r"
    fi
fi
}

installations(){
  echo "[Installations]"  
  echo -e "\n\t [snap]"
  snaps=("chromium" "discord" "spotify" "code --classic" "htop" "vlc")
  for ((i = 0; i < ${#snaps[@]}; i++));do
    install_snap ${snaps[$i]}
  done
  echo -e "\n\t [apt]"
  apts=("neofetch" "git" "vim")
  for ((i = 0; i < ${#apts[@]}; i++));do
    install_apt ${apts[$i]}
  done
}

install_apt() {
  echo -e " \t [ ] $1"
  sudo apt install $1 -y &>> $logs
  if [ $? -eq 0 ];then
      print_state $1 $OK
  else
      print_state $1 $NS
  fi
}

print_state() {
  echo -e " \t \e[1A\e[K[$2] $1\r"
}


install_snap(){
  echo -e " \t [ ] $1"
  sudo snap install $1 --classic &>> $logs
  

  if [ $? -eq 0 ];then
      print_state $1 $OK
  else
      print_state $1 $KO
  fi
  }

config(){
  echo "[Configurations]"
  log_file="./log_config.txt"

  if [ -f $log_file ]; then
    rm $log_file;
  fi

  for filename in ./configs/*.sh; do
  chmod +x $filename

  echo -en " \t [ ] Applying " 
  basename $filename .sh
  bash ./$filename &>> $log_file
  if [ $? -eq 0 ];then
      echo -ne " \t \e[1A\e[K[$OK] "
      basename $filename .sh
  else
      echo -ne " \t \e[1A\e[K[$KO] "
      basename $filename .sh
  fi
  done
}

init
installations
config
