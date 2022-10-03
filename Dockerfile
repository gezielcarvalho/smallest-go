FROM golang:1.18-bullseye AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /server .
# RUN go build -o /server

RUN rm -Rf models routers vendor \
    && rm -f Dockerfile go.mod go.sum

FROM scratch AS final

COPY --from=build /server /server

ENTRYPOINT ["/server"]