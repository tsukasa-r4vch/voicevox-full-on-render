FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 必要な依存パッケージをインストール
RUN apt-get update && apt-get install -y \
    curl wget git unzip ca-certificates build-essential \
    libsndfile1 libomp-dev ffmpeg python3 python3-pip \
 && rm -rf /var/lib/apt/lists/*

# voicevox_engine の最新版をダウンロード
WORKDIR /app
RUN wget https://github.com/VOICEVOX/voicevox_engine/releases/latest/download/voicevox_engine-linux-x64.tar.gz \
 && tar -xzf voicevox_engine-linux-x64.tar.gz \
 && rm voicevox_engine-linux-x64.tar.gz

# ポートを開放
EXPOSE 50021

# エントリポイントを起動コマンドに設定
CMD ["./run"]
