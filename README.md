# InstructLab コンテナイメージのビルドと実行

この手順では、Podmanを使用してInstructLabのコンテナイメージをビルドし、`instructlab:latest` としてタグ付けされたイメージを実行する方法を説明します。

## 必要なファイル

この手順では、以下のファイルが必要です：
1. `Dockerfile`（提供済み）
2. `config.yaml`（提供済み）

## コンテナイメージのビルド手順

1. **Dockerfileとconfig.yamlを準備**

   提供された `Dockerfile` と `config.yaml` を同じディレクトリに配置します。

2. **Podmanコマンドでコンテナイメージをビルド**

   以下のコマンドを実行して、`instructlab:latest` というタグでコンテナイメージをビルドします：

   ```bash
   podman build -t instructlab:latest .
   ```

   このコマンドは、現在のディレクトリにある `Dockerfile` を使用して `instructlab` のコンテナイメージをビルドし、`instructlab:latest` というタグを付けます。

3. **イメージが正常にビルドされたか確認**

   イメージが正しくビルドされたことを確認するために、以下のコマンドを実行します：

   ```bash
   podman image ls
   ```

   `instructlab:latest` のタグ付きイメージが一覧に表示されているはずです。

## コンテナの実行手順

1. **コンテナの起動**

   ビルドされた `instructlab:latest` イメージを使って、コンテナをバックグラウンドで起動します：

   ```bash
   podman run -d -p 8000:8000 instructlab:latest
   ```

   このコマンドにより、コンテナがバックグラウンドで起動し、ポート `8000` をホストにマッピングして、InstructLabモデルサーバーが実行されます。

2. **コンテナのログを確認**

   コンテナが正常に動作しているか確認するために、コンテナのログを表示します：

   ```bash
   podman logs -f <コンテナID>
   ```

   `podman ps` コマンドで実行中のコンテナのIDを確認し、そのIDを `logs` コマンドに置き換えてログを確認します。

3. **APIドキュメントにアクセス**

   コンテナが正常に起動したら、以下のURLにアクセスしてInstructLabのAPIドキュメントを確認できます：

   ```
   http://localhost:8000/docs
   ```

   このページでは、InstructLabのエンドポイントに関する詳細な情報が表示されます。

## コンテナの停止

コンテナを停止するには、以下のコマンドを使用します：

```bash
podman stop <コンテナID>
```

コンテナを削除するには、以下のコマンドを使用します：

```bash
podman rm <コンテナID>
```

