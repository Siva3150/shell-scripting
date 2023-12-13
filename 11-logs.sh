#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo " Script started executing at $TIMESTAMP " &>> $LOGFILE

echo "script name :: $0"

VALIDATE() {

if [ $1 -ne 0 ]
then
   echo "  ERROR :: Installing $2 is $R failed "
   exit 1
else
   echo "Installing $2 is $G success"
fi

}

if [ $ID -ne 0 ]
then
   echo " ERROR :: $R please run this script with root access "
   exit 1
else
   echo " you are root user "
fi

yum install mysql -y   &>> $LOGFILE

VALIDATE $? "Installing MYSQL" 

yum install git -y  &>> $LOGFILE

VALIDATE  $? "Installing git"  
