FROM python:3.8-slim

# 音声合成に必要なライブラリ
RUN apt-get update && apt-get install -y \
    curl git unzip ffmpeg \
    libsndfile1 libgomp1 espeak-ng \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Pythonパッケージのインストール
RUN pip install --upgrade pip && \
    pip install "uvicorn[standard]" \
    git+https://github.com/VOICEVOX/voicevox_engine.git

# 作業ディレクトリの設定
WORKDIR /app

# コンテナ起動時にエンジンを実行
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
