# 公式VOICEVOXエンジンCPU版イメージをベースにする（ビルド済みで最適化済み）
FROM voicevox/voicevox_engine:cpu-latest

# ポート番号を明示的に開放
EXPOSE 50021

# Renderなどで起動コマンドが指定できない場合のためCMDも指定
CMD ["/opt/voicevox_engine/run.sh"]
