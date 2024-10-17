FROM --platform=$BUILDPLATFORM minixxie/golang:1.21.0 as golang

ARG BUILDPLATFORM

WORKDIR /usr/local/go/src/app

COPY ./go.mod .
COPY ./go.sum .
RUN go mod download

ADD . .
RUN ./scripts/build.sh
RUN cp ./scripts/test.sh /test.sh
RUN cp ./bin/app /

ADD ./nodejs-project /tmp/old/nodejs-project
