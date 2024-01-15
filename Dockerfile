FROM golang:latest AS build
WORKDIR /usr/src/app
COPY . .
RUN apt-get update
RUN go build arq.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/arq .
CMD ["./arq"]