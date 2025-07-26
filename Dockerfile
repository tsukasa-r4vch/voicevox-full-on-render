# 公式VOICEVOXエンジンのイメージをベースにする
FROM voicevox/voicevox_engine:latest

# ポート番号を明示的に開放
EXPOSE 50021

# Renderで起動コマンドを指定するならCMDは不要ですが、念のため
CMD ["python3", "-m", "voicevox_engine.run", "--host", "0.0.0.0", "--port", "50021"]
