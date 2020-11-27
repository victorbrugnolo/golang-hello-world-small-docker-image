FROM golang:1.14 AS builder

WORKDIR /go/src/app
COPY ./index.go .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o  ./bin/index

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app/bin .

CMD ["./index"]