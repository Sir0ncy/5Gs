# Open5GS 5G Network Lab

Containerized 5G network and slicing lab using Open5GS and UERANSIM.

## Current Topology
* Slice 1: SST 1, SD 000001
* Slice 2: SST 1, SD 000002
* UE1: 100.100.100.2
* UE2: 200.200.200.2
* One simulated gNB serves both UEs

## How to Run

Start Open5GS:

```bash
docker compose -f sa-deploy.yaml up -d
```

Start UERANSIM:

```bash
cd ueransim
docker compose up
```

Check Open5GS:

```bash
docker compose -f sa-deploy.yaml ps
```

Check UERANSIM:

```bash
docker compose ps
```

Project Structure
.
├── sa-deploy.yaml
├── .env.example
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