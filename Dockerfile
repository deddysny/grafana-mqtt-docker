FROM golang:alpine as plugin-builder

RUN apk add --no-cache yarn git

RUN git clone https://github.com/magefile/mage --depth=1
RUN git clone https://github.com/grafana/mqtt-datasource.git --depth=1

RUN cd mage && go run bootstrap.go

RUN cd mqtt-datasource && yarn install && yarn build

FROM grafana/grafana

COPY --from=plugin-builder /go/mqtt-datasource $GF_PATHS_PLUGINS

ENV GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=grafana-mqtt-datasource

EXPOSE 3000

USER grafana
ENTRYPOINT [ "/run.sh" ]
