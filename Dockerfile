FROM golang:alpine AS builder
LABEL MAINTAINER="liqiulin@outlook.com"

RUN mkdir -p /app/build/
WORKDIR /app/build/
ADD . /app/build/

RUN go build

FROM alpine:latest
WORKDIR /root/

COPY --from=builder /app/build/ipself-go ./ipself

EXPOSE 80

CMD ["./ipself"]
