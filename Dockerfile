# ベースイメージ：Pythonと必要なライブラリを含む軽量Debian系
FROM python:3.10-slim

# 必要パッケージのインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ作成
WORKDIR /app

# VOICEVOX ENGINEのクローン
RUN git clone --depth 1 https://github.com/VOICEVOX/voicevox_engine.git .

# Pythonパッケージのインストール
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install .

# ポート公開
EXPOSE 50021

# 起動コマンド（RenderがCMDを使わない場合はRender側で指定）
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
