#!/bin/sh

echo "Cloning repositories..."

# Create a Sites directory
mkdir $HOME/Sites 2> /dev/null

# Create sites subdirectories
mkdir $HOME/Sites/copypaste 2> /dev/null
mkdir $HOME/Sites/sideline 2> /dev/null
mkdir $HOME/Sites/personal 2> /dev/null

SITES=$HOME/Sites
WORK=$SITES/copypaste
SIDELINE=$SITES/sideline
PERSONAL=$SITES/personal

# Personal
git clone git@github.com:StackEngr/paypal-php-sdk.git $PERSONAL/paypal-php-sdk 2> /dev/null || echo "paypal-php-sdk project repository already exists"

# Sideline
git clone git@github.com:StackEngr/Royal.git $SIDELINE/royal 2> /dev/null || echo "royal project repository already exists"

# Work
git clone git@gitlab01.copyleft.no:gsean/honning.git $WORK/honning 2> /dev/null || echo "honning project repository already exists"
git clone git@gitlab01.copyleft.no:gsean/dus-online-academy.git $WORK/dusakademiet 2> /dev/null || echo "dusakademiet project repository already exists"
git clone git@gitlab01.copyleft.no:copypaste/spellemannprisen.git $WORK/spellemannprisen 2> /dev/null || echo "spellemannprisen project repository already exists"
git clone git@gitlab01.copyleft.no:ringo/stemcell.git $WORK/stamcelleklinikken 2> /dev/null || echo "stamcelleklinikken project repository already exists"

