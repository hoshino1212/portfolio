# ベースイメージとしてRubyを使用
FROM ruby:3.2.2

# Node.jsとYarnをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# アプリケーションのディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp
RUN apt-get install -y cron

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Gemをインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /myapp

# デフォルトのコマンドを設定
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
