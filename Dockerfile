FROM docker.io/r4vch/voicevox:latest

# uvicorn & voicevox_engine を確実にインストール
RUN pip install --upgrade pip && \
    pip install "uvicorn[standard]" voicevox_engine

EXPOSE 50021

CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
