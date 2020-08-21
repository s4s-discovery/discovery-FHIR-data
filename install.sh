#!/bin/bash
# Discovery FHIR Data installer
# 20200821/SK

# Install prerequisites
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install http-server -g

# Rewrite DSTU2 service file to reference install dir
SUBST=s@WORKINGDIR@$PWD@g
sed $SUBST DiscoveryDSTU2Data.service.template > DiscoveryDSTU2Data.service

# Setup and start DSTU2 demo data service
sudo systemctl stop    DiscoveryDSTU2Data.service
sudo systemctl disable DiscoveryDSTU2Data.service
sudo systemctl enable  $PWD/DiscoveryDSTU2Data.service
sudo systemctl start   DiscoveryDSTU2Data.service

# Rewrite DSTU3 service file to reference install dir
sed $SUBST DiscoveryDSTU3Data.service.template > DiscoveryDSTU3Data.service

# Setup and start DSTU3 demo data service
sudo systemctl stop    DiscoveryDSTU3Data.service
sudo systemctl disable DiscoveryDSTU3Data.service
sudo systemctl enable  $PWD/DiscoveryDSTU3Data.service
sudo systemctl start   DiscoveryDSTU3Data.service

# Done
echo
echo Installation complete!
