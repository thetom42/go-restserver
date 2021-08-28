FROM golang:1.16 AS build
LABEL quay.expires-after=1h

USER root

ADD . /temp/

RUN cd /temp/cmd/go-restserver && CGO_ENABLED=1 go build -tags netgo -a -v

FROM alpine:3.14
LABEL quay.expires-after=27w

USER root

COPY --from=build /temp/cmd/go-restserver/go-restserver /usr/local/bin

EXPOSE 1323

ENTRYPOINT ["go-restserver"]