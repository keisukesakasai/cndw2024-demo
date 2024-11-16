#!/bin/bash

# エラー発生時にスクリプトを終了する設定
set -e

# OpAMP Server の実行
echo "Executing OpAMP Server..."
cd opamp-go/internal/examples/server
go run .
echo "OpAMP Server executed successfully."