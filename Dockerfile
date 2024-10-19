# Red Hat UBI 9に基づくPython 3.11のイメージを使用
FROM registry.access.redhat.com/ubi9/python-311

# コンテナ内の作業ディレクトリを設定
WORKDIR /app

# 必要なシステム依存パッケージをインストール
USER root
RUN dnf install -y \
    git \
    && dnf clean all

# pipを最新バージョンにアップデート
RUN pip install --upgrade pip

# InstructLabと依存関係をインストール
RUN pip install git+https://github.com/abetlen/llama-cpp-python.git
RUN pip install instructlab

# ローカルの設定ファイルをコンテナにコピー
COPY ./config.yaml /opt/app-root/src/.config/instructlab/config.yaml

# InstructLabの設定を初期化
RUN ilab config init --non-interactive

# モデルをダウンロード
RUN ilab model download

# モデルサーバーを起動する
CMD ["ilab", "model", "serve"]

