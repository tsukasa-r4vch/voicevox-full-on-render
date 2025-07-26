FROM docker.io/r4vch/voicevox:latest

# uvicorn を追加インストール（FastAPI実行用）
RUN pip install --no-cache-dir uvicorn

EXPOSE 50021

# FastAPIアプリとして起動
CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
