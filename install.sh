#!/bin/sh

echo "Type the type of installation that you want (Digit), followed by [ENTER]:"

update(){
    apt-get update
    apt-get -y upgrade 
}

base(){
    apt-get -y install emacs
    apt-get -y install wget
    apt-get -y install net-tools
    apt-get -y install curl
    cp script/automate.sh /bin/ && chmod +x /bin/automate.sh
}

read choice
update
if [ "$choice" -eq "1" ]
then
    echo "Install web serveur."
    base
    apt-get -y install apache2
    apt-get -y install lsb-release apt-transport-https ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.3.list
    update
    apt-get -y install php7.3
    apt-get -y install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json
    apt-get -y install libapache2-mod-php7.3

elif [ "$choice" -eq "2" ]
then
  echo "Security"
 apt-get -y install tcpdump
 apt-get -y install fail2ban
else
    echo "Install Base"
    base
fi     # $String is null.
 
