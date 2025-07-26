FROM docker.io/r4vch/voicevox:latest

EXPOSE 50021

CMD ["uvicorn", "voicevox_engine.run:app", "--host", "0.0.0.0", "--port", "50021"]
