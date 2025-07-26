# ベースイメージは公式Python（必要な依存を入れるため）
FROM python:3.10-slim

# 作業ディレクトリを作成
WORKDIR /app

# 必要なシステムパッケージ
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# VOICEVOX ENGINE をクローン（最新のmainを取得）
RUN git clone --depth=1 https://github.com/VOICEVOX/voicevox_engine.git /app/voicevox_engine

# pip用のセットアップファイル（同階層の setup.py をコピー）
COPY setup.py ./

# Python依存をインストール（必要ならrequirements.txtに変更も可能）
RUN pip install --upgrade pip && pip install .

# ポートを開放
EXPOSE 50021

# 起動コマンド
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
