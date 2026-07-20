FROM golang:1.25 AS build

ENV CGO_ENABLED=0

RUN go install github.com/jesseduffield/lazydocker@latest

FROM docker:cli

COPY --from=build /go/bin/lazydocker /usr/local/bin/lazydocker

ENTRYPOINT ["lazydocker"]
