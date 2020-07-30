#!/bin/bash
# Discovery FHIR Data installer
# 20200729/SK

# Install prerequisites
sudo apt install npm
sudo npm install http-server -g

# Rewrite DSTU2 service file to point to install dir
SUBST=s@WORKINGDIR@$PWD@g
sed $SUBST DiscoveryDSTU2Data.service.template > DiscoveryDSTU2Data.service

# Setup and start DSTU2 demo data service
sudo rm /lib/systemd/system/DiscoveryDSTU2Data.service 2> /dev/null
sudo ln -s $PWD/DiscoveryDSTU2Data.service /lib/systemd/system/DiscoveryDSTU2Data.service
sudo systemctl enable DiscoveryDSTU2Data.service
sudo systemctl start DiscoveryDSTU2Data.service

# Rewrite DSTU3 service file to point to install dir
sed $SUBST DiscoveryDSTU3Data.service.template > DiscoveryDSTU3Data.service

# Setup and start DSTU3 demo data service
sudo rm /lib/systemd/system/DiscoveryDSTU3Data.service 2> /dev/null
sudo ln -s $PWD/DiscoveryDSTU3Data.service /lib/systemd/system/DiscoveryDSTU3Data.service
sudo systemctl enable DiscoveryDSTU3Data.service
sudo systemctl start DiscoveryDSTU3Data.service

# Done
echo
echo Installation complete!
