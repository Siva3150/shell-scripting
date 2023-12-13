#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script name :: $0"

VALIDATE() {

if [ $1 -ne 0 ]
then
   echo "  ERROR :: Installing $2 is failed "
   exit 1
else
   echo "Installing $2 is success"
fi

}

if [ $ID -ne 0 ]
then
   echo " ERROR :: please run this script with root access "
   exit 1
else
   echo " you are root user "
fi

yum install mysql -y   &>> $TIMESTAMP

VALIDATE $? "Installing MYSQL" 

yum install git -y  &>> $TIMESTAMP

VALIDATE  $? "Installing git"  
