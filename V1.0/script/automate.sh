#!/bin/bash
echo -e "\033[33m$1\033[0m"
echo -e "\033[31mDebut\033[0m"
git pull
echo -e "OK ??"
read -n1 kbd
echo "$kdb"
echo -e "Etes vous sur denvoyer sur la branche master"
read -n1 kbd
git config --global user.name "baptiste"
git config --global user.email baptiste.heraud@epitech.eu
git add --all
git commit -am "$1"
git push origin master

echo -e "\033[31mFin\033[0m"
