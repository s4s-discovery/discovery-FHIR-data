# S4S Discovery FHIR Demo Data Providers

The S4S Discovery application consists of the following components:

1. **The Discovery FHIR Demo Data Providers (this package)** [<https://github.com/sync-for-science/discovery-FHIR-data>]
2. The Discovery Data Server [<https://github.com/sync-for-science/discovery-data-server>]
3. The Discovery Application Server [<https://github.com/sync-for-science/discovery>]

This package sets up two lightweight services to provide demo FHIR bundles for the S4S Discovery application.

All three packages can be installed on the same Linux instance, but the DNS/IP addresses for each component's instance must be known/determined before installation.

## Installation of the Discovery FHIR Demo Data Providers

Verify the target system is current:

    sudo apt update
    sudo apt upgrade

Clone this repository:

    cd ~
    git clone https://github.com/sync-for-science/discovery-FHIR-data
    cd discovery-FHIR-data

Run the **install.sh** script (you must have sudo privileges):

    ./install.sh

## Checking Status

- `sudo systemctl status DiscoveryDSTU2Data.service`
- `sudo systemctl status DiscoveryDSTU3Data.service`
