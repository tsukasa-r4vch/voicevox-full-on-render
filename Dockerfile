FROM docker.io/r4vch/voicevox:latest

EXPOSE 50021

CMD ["python3", "run.py", "--host", "0.0.0.0", "--port", "50021"]
