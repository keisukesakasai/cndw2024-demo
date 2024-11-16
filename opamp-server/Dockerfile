# Build stage
FROM golang:1.22 AS builder

# 作業ディレクトリを設定
WORKDIR /

# プロジェクト全体をコピー
COPY . .

# server ディレクトリに移動してビルド
WORKDIR /
RUN go build .

# Runtime stage
FROM debian:bookworm

# 必要なツールをインストール
RUN apt-get update && apt-get install -y ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR /

# ビルド済みのバイナリをコピー
COPY --from=builder / /

# バイナリに実行権限を付与
RUN chmod +x /opamp-server

# 必要に応じてポートを公開
EXPOSE 4321

# デフォルトの実行コマンド
CMD ["/opamp-server"]
