# Open5GS 5G Network Slicing Lab

A containerized 5G Standalone (5G SA) lab using Open5GS and UERANSIM.

This lab is designed to experiment with basic 5G network slicing using simulated UEs and a simulated gNB before moving to real USIM, UE, and USRP B210 hardware.

## Architecture

```text
                         Open5GS 5GC
                              |
                             AMF
                              |
                            NSSF
                        /           \
                     SMF1           SMF2
                  Slice 1/000001  Slice 1/000002
                      |               |
                     UPF1            UPF2
                      |               |
               100.100.100.0/24  200.200.200.0/24
                      |               |
                     UE1             UE2
```

## Components

* Open5GS 5G Core
* UERANSIM simulated gNB
* UERANSIM simulated UE1
* UERANSIM simulated UE2
* Two SMF instances
* Two UPF instances
* NSSF for slice selection
* MongoDB for subscriber data

## Repository Structure

```text
.
├── sa-deploy.yaml
├── .env.example
├── base/
├── amf/
├── ausf/
├── bsf/
├── nrf/
├── nssf/
├── pcf/
├── scp/
├── udm/
├── udr/
├── smf-1/
├── smf-2/
├── upf-1/
├── upf-2/
└── ueransim/
    ├── docker-compose.yaml
    └── config/
        ├── gnb.yaml
        ├── ue-1.yaml
        └── ue-2.yaml
```

## Network Slices

### Slice 1

```text
SST: 1
SD:  000001
DNN: internet
Subnet: 100.100.100.0/24
Gateway: 100.100.100.1
```

### Slice 2

```text
SST: 1
SD:  000002
DNN: internet
Subnet: 200.200.200.0/24
Gateway: 200.200.200.1
```

## Requirements

* Docker or Podman with Docker Compose compatibility
* Open5GS Docker image
* UERANSIM Docker image
* Linux host

## Configuration

Copy the example environment file:

```bash
cp .env.example .env
```

Edit `.env` and configure the container IP addresses and slice subnets.

Do not commit the real `.env` file.

## Run Open5GS

```bash
docker compose -f sa-deploy.yaml up -d
```

Check the services:

```bash
docker compose -f sa-deploy.yaml ps
```

## Run UERANSIM

```bash
cd ueransim
docker compose up
```

The UERANSIM setup starts:

```text
ueransim-gnb
ueransim-ue1
ueransim-ue2
```

## Expected Result

UE1 should establish a PDU session using:

```text
S-NSSAI: 1/000001
IP: 100.100.100.2
```

UE2 should establish a PDU session using:

```text
S-NSSAI: 1/000002
IP: 200.200.200.2
```

The two slices use separate SMF and UPF instances and separate IPv4 address pools.

## Current Goal

The current lab demonstrates:

```text
5G registration
        |
        v
PDU session establishment
        |
        v
S-NSSAI based slice separation
        |
        v
Separate SMF/UPF paths
        |
        v
Separate UE IP networks
```

Future experiments can extend this setup to QoS, traffic isolation, real USIM authentication, a real UE, and a USRP B210 based gNB.

## Security

Do not commit:

* `.env`
* subscriber credentials
* Ki / OP / OPc values
* private keys
* runtime logs
* database files

Use `.env.example` and example subscriber credentials for documentation.
