# builder stage
FROM golang:1.13-alpine as builder
WORKDIR $GOPATH/src/eliskovets/go-dummy
COPY . .
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/go-dummy

# image stage
FROM scratch
COPY --from=builder /go/bin/go-dummy /go/bin/go-dummy
EXPOSE 9101
ENTRYPOINT ["/go/bin/go-dummy"]
