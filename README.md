### 概要
CloudNative Days Winter 2024 のデモ

### 内容
- OpAMP Backend
  - `opamp-go` リポジトリのサンプルコードを拝借 https://github.com/open-telemetry/opamp-go/tree/main/internal/examples/server
  - ただしバインドポートが localhost に限定されている（Issue: https://github.com/open-telemetry/opamp-go/issues/270）ため、その部分のみ変更
- OTel Collector with Supervisor
  - OTel Collector Contrib の Supervisor を拝借。適当に Dockerfile 作成
  - https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/cmd/opampsupervisor
  - このバイナリに、OpAMP Supervisor と OTel Collector（OpAMP Client Extension）が付属
- 他のアプリケーションレイヤ（OTel Collector 含む）は、OTel Collector Contrib の demo を拝借
  - https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/examples/demo

### 備考
- 一応ローカルでも OpAMP Backend / OTel Collector with Supervisor は動かせる
```sh
# OpAMP Server
$ cd opamp-backend
$ go run .

# OpAMP Supervisor
$ cd otel-collector-with-supervisor
$ go run . --config ./demo/supervisor_darwin_local.yaml ( for Mac )
```