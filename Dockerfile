FROM docker.io/r4vch/voicevox:latest

# Pythonをインストール（Ubuntuベース前提）
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app

# （必要なら）run.py をコピー
COPY run.py /app/

EXPOSE 50021

CMD ["python3", "run.py", "--host", "0.0.0.0", "--port", "50021"]
