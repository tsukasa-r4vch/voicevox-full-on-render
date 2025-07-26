FROM python:3.10-slim

# 必要な依存パッケージをすべてインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    unzip \
    cmake \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ作成
WORKDIR /app

# VOICEVOXエンジンをGitHubからクローン
RUN git clone --depth 1 https://github.com/VOICEVOX/voicevox_engine.git .

# Pythonパッケージをインストール
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install --no-build-isolation .

# ポート開放
EXPOSE 50021

# 起動コマンド
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
