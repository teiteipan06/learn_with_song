# アプリケーション名
LEARN WITH SONG

# アプリケーション概要
歌で外国語を勉強する

# URL
まだ製作中なので、一旦なし

# 利用方法
## 曲の投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 曲を追加のページで新曲のタイトル、動画のURL、シンガー、カテゴリー、歌詞を投稿する

## 曲で外国語を学ぶ
1. 一覧ページで好きな曲を探し、クリックして、曲の歌詞が見える
2. 歌詞を読んで、一緒に歌ってみて、最後はその外国語も覚えるようになる

# アプリケーションを作成した背景
自分が日本に来る前に、台湾で日本語を勉強した。その時に、教科書や講義をで勉強するより、
日本の歌で日本語を勉強するのは一番効率が良かったと気ついた。なぜなら、やはり歌で勉強するのは面白いからだ。
自然に日本語の歌詞を読んで、歌詞を口に出して、まさに言語を学ぶには最も重要なことだ。
日本でも、私と同じく外国語を学びたい人がいると思うので、楽しくて勉強して欲しいと思いながらこのアプリケーションを開発することにした。

# 洗い出した要件
要件定義したシート（https://docs.google.com/spreadsheets/d/1USy_t-R_EBjlTTiHXJ7aJ3Zz0oL_S2VteW_lblbMKw0/edit?usp=sharing）

# 実測機能
現在、まだ実装中なので、一旦なし

# テーブル設計
## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| lase_name          | string | null: false               |
| nationality        | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :songs
- has_many :likes
- has_many :comments
----------------------------

## songs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| video           | string     | null: false                    |
| singer          | string     | null: false                    |
| category        | string     | null: false                    |
| lyrics_origin   | text       | null: false                    |
| lyrics_japanese | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :likes
- has_many :comments
- belongs_to :user
----------------------------

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       |                                |
| song      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :song
- belongs_to :user
----------------------------

## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| song      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :song
- belongs_to :user


# 開発環境
- ruby 2.6.5
- Rails 6.0.3.4
- MySQL 5.6.47

# ローカルでの動作方法
以下のコマンドを順に実行。

% git clone https://github.com/teiteipan06/learn_with_song.git  
% cd learn_with_song  
% bundle install  
% rails db:create  
% rails db:migrate    
% yarn install
