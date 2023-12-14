#!/bin/bash

ID=(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="\tmp\$0-$TIMESTAMP.log

echo "script started executing at $TIMESTAMP " &>> $LOGFILE

VALIDATE(){
    if [ $1 ne 0 ]
    then 
     echo -e "  $2 ....  $R FAILED $N "
    else
      echo -e "  $2  .... $G SUCCESS $N "
    fi
}

if [ $ID ne 0 ]
then
  echo " $R Error :: run this script with root access "
  exit 1
else
  echo " $G you are root user "
fi

#echo " All arguments passed : $@

for package in $@
do
yum list installed $package  &>> $LOGFILE
if [ $? ne 0 ]
then 
   yum install $package -y   &>> $LOGFILE
   VALIDATE $? " installing of $package "
else
   echo -e " $package is already installed .... $Y SKIPPING $N "
fi 
done