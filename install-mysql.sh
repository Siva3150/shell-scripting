#!/bin/bash

ID=(id -u)

if [ ID -ne 0 ]
then

echo "proceed with the intallation with root access "

else

echo " stop and run this script with root access "
fi

install mysql -y