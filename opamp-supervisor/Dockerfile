FROM golang:1.22 AS builder

WORKDIR /app

COPY . .
RUN go mod download
RUN go build .

FROM debian:bookworm
RUN apt-get update && apt-get install -y ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/opampsupervisor /app/opampsupervisor
COPY demo/supervisor_linux.yaml /app/supervisor_linux.yaml
COPY demo/otelcontribcol_linux_amd64 /app/otelcontribcol_linux_amd64

RUN chmod 775 /app/opampsupervisor

EXPOSE 4320

CMD ["/app/opampsupervisor", "--config", "/app/supervisor_linux.yaml"]
