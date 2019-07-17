FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

RUN apt-get update

# 表示言語と入力言語を日本語向けに設定
RUN apt-get install -y locales 
RUN apt-get install -y language-pack-ja-base language-pack-ja 
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8

# タイムゾーンをAsia/Tokyoに変更
ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# bash関係の基本コマンドをインストール
RUN apt-get install -y bash-completion
RUN apt-get install -y less
RUN apt-get install -y vim
RUN apt-get install -y iputils-ping

# SQL Serverインストール用のデフォルト設定
#   エディション：Developer
#   初期パスワード：P@ssw0rd
#   使用するポート：1433
#   言語：日本語
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer
ENV MSSQL_SA_PASSWORD=P@ssw0rd
ENV MSSQL_TCP_PORT=1433
ENV MSSQL_LCID=1041

# SQL Serverのコマンドラインツールにパスを通す
ENV PATH=$PATH:/opt/mssql-tools/bin
