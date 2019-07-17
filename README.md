# mssql-server-linux-ja_jp

Microsoft公式のSQLServerのイメージ( https://hub.docker.com/_/microsoft-mssql-server )に、  
日本語の設定を追加したイメージです。

## デフォルトの設定
SQL Serverインストール時の設定(環境変数)として、  
下記をデフォルトで指定しています。
* エディション：Developer
* 初期パスワード：P@ssw0rd
* 使用するポート：1433
* 言語：日本語

## 起動
上記の設定で問題ない場合は、  
下記のように `docker run` を実行することでSQL Serverが起動し 、  
`localhost:1433` でアクセスできるようになります。
```
docker run -it -d -p 1433:1433 pekotaro/mssql-server-linux-ja_jp
```

## デフォルト設定の変更
デフォルトの設定を変更したい場合は、  
下記のように`docker run`実行時に環境変数を上書いてください。
```
# エディションをExpressに変更
docker run -it -d -p 1433:1433 -e MSSQL_PID=Express pekotaro/mssql-server-linux-ja_jp
```

設定可能な環境変数のリストは下記リンク先をご参照ください。  
https://docs.microsoft.com/ja-jp/sql/linux/sql-server-linux-configure-environment-variables?view=sql-server-2017
