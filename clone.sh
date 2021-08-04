#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites
WORK=$SITES/copypaste
SIDELINE=$SITES/sideline
PERSONAL=$SITES/personal

# Personal
git clone git@github.com:StackEngr/paypal-php-sdk.git $PERSONAL/paypal-php-sdk

# Sideline
git clone git@github.com:StackEngr/Royal.git $SIDELINE/royal

# Work
git clone git@gitlab01.copyleft.no:gsean/honning.git $WORK/honning
git clone git@gitlab01.copyleft.no:gsean/dus-online-academy.git $WORK/dusakademiet
git clone git@gitlab01.copyleft.no:copypaste/spellemannprisen.git $WORK/spellemannprisen

