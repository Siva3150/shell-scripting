#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
   echo " given $NUMBER  is greather than 100 "
else
   echo " given  $NUMBER is less than 100 "
fi