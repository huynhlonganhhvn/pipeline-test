FROM golang:1.12 as build

WORKDIR /go/src/app
COPY . .
#RUN apk add --no-cache git
RUN go get -d -v ./...
RUN CGO_ENABLED=0 GOOS=linux go install -a -v ./...
RUN ls -la

FROM alpine:latest
WORKDIR /app
COPY --from=build /go/bin/app .
RUN ls -la
CMD ["./app"]
