# ベースイメージは軽量なpython3.8-slimにします
FROM python:3.8-slim

# システム依存パッケージをインストール
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libsndfile1 \
    espeak-ng \
    curl \
    unzip \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを作成して設定
WORKDIR /app

# 必要なPythonパッケージを先にインストール（uvicornやbuild用のパッケージも）
RUN pip install --upgrade pip setuptools wheel
RUN pip install "uvicorn[standard]" pydantic

# voicevox_engine をGitHubからcloneしインストール
RUN git clone https://github.com/VOICEVOX/voicevox_engine.git /app/voicevox_engine
WORKDIR /app/voicevox_engine
RUN pip install .

# ポート番号を明示的に公開
EXPOSE 50021

# コンテナ起動時に実行するコマンド
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
