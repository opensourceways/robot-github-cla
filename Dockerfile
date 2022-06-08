FROM golang:latest as BUILDER

MAINTAINER zengchen1024<chenzeng765@gmail.com>

# build binary
WORKDIR /go/src/github.com/opensourceways/robot-gitee-github-cla
COPY . .
RUN GO111MODULE=on CGO_ENABLED=0 go build -a -o robot-gitee-github-cla .

# copy binary config and utils
FROM alpine:3.14
COPY  --from=BUILDER /go/src/github.com/opensourceways/robot-gitee-github-cla/robot-gitee-github-cla /opt/app/robot-gitee-github-cla

ENTRYPOINT ["/opt/app/robot-gitee-github-cla"]