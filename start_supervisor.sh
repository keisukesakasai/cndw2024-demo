#!/bin/bash

# エラー発生時にスクリプトを終了する設定
set -e

# OpAMP Supervisor の実行
echo "Executing OpAMP Supervisor..."
cd opamp-supervisor
go run . --config ./demo/supervisor_darwin_local.yaml
echo "OpAMP Supervisor executed successfully."