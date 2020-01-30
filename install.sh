#!/bin/sh

echo "Type the type of installation that you want (Digit), followed by [ENTER]:"
echo "1. install web serveur"
echo "2. install security"
echo "3. install mysql"
echo "4. install all"

update(){
    apt-get update
    apt-get -y upgrade 
}

base(){
    apt-get -y install emacs
    apt-get -y install htop
    apt-get -y install wget
    apt-get -y install net-tools
    apt-get -y install curl
    apt-get -y install python3
    apt-get -y install sudo 
    cp script/automate.sh /bin/ && chmod +x /bin/automate.sh
}

webserver(){
    apache
}

apache(){
    echo "Install apache serveur."
    apt-get -y install apache2
    apt-get -y install lsb-release apt-transport-https ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /et$
    update
    apt-get -y install php7.3
    apt-get -y install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysq$
    apt-get -y install libapache2-mod-php7.3
    apt-get -y install certbot python-certbot-apache

    PHPVersion=$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,3);
    echo $PHPVersion
}

mysql(){
    apt-get install -y mysql-server
}

security(){
   echo "Security"
   apt-get -y install tcpdump
   apt-get -y install fail2ban
}

installAll(){
   echo "install all"
   base
   mysql
   security
   web
}

read choice
update
base
if [ "$choice" -eq "1" ]
then
<<<<<<< HEAD
    webserver
=======
    echo "Install web serveur."
    apt-get -y install apache2
    apt-get -y install lsb-release apt-transport-https ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.3.list
    update
    apt-get -y install php7.3
    apt-get -y install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json
    apt-get -y install libapache2-mod-php7.3
    apt-get -y install certbot python-certbot-apache

    PHPVersion=$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,3);
   echo $PHPVersion
>>>>>>> ae6fa5978a01ac6f2a52c71a356a905c4204e850
elif [ "$choice" -eq "2" ]
then
  security
elif [ "$choice" -eq "3" ]
then
  mysql
elif [ "$choice" -eq "4" ]
then
  installAll
else
    echo "Install Base"
    base
fi
 
