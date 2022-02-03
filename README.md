# grafana-mqtt-docker
Install grafana-mqtt-docker
## Build
```sh
git clone https://gist.github.com/82b2a1be7708ddcf71746cd86f2c5de0.git grafana-mqtt-docker
cd grafana-mqtt-docker
docker-compose build
```

## Start
```sh
cd grafana-mqtt-docker
docker-compose up -d
```

Then open http://localhost:3000 in your browser and login with the username`admin` and password `admin`.

## Stop
```sh
cd grafana-mqtt-docker
docker-compose down
