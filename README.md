# アプリケーション名
LEARN WITH SONG

# アプリケーション概要
歌詞で外国語を勉強することができるアプリ

# URL
https://learn-with-song-287m.onrender.com/


# テスト用アカウント
・Basic認証ID：admin

・Basic認証パスワード：2222

・メールアドレス1：test@com

・パスワード1：test123

・メールアドレス2：test2@com

・パスワード2：test1234


# 利用方法
## 曲の投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 曲を追加のページで新曲のタイトル、動画のURL、シンガー、カテゴリー、歌詞を投稿する

## 外国語の曲で外国語を学ぶ
1. 一覧ページで好きな曲を探し、クリックして、曲の歌詞が見える
2. 歌詞を読んで、一緒に歌ってみて、最後はその外国語も覚えるようになる

# アプリケーションを作成した背景
自分が日本に来る前に、台湾で日本語を勉強しました。
その際に、教科書や講義で勉強をするより、日本の歌で日本語を勉強することが一番効率が良かったと気づきました。
なぜなら、やはり歌で勉強するのは面白いためです。

自然に日本語の歌詞を読んで、歌詞を口に出して、まさに言語を学ぶには最も重要なことだと感じます。
日本でも、私と同じく外国語を学びたい人がいると思うので、楽しく勉強して欲しいという思いからこのアプリケーションを開発することにいたしました。

# 洗い出した要件
要件定義したシート（https://docs.google.com/spreadsheets/d/1USy_t-R_EBjlTTiHXJ7aJ3Zz0oL_S2VteW_lblbMKw0/edit?usp=sharing）

# 実装機能
## 1. ユーザー登録機能
---
ユーザー登録することで新曲の登録・編集・削除できるようになります。（ユーザー登録していない人でも登録している曲を見ることは可能です。）

## 2. 新曲の登録機能
---
新曲の動画URL、情報を入力すると、新曲を登録することができます。

## ３. 曲の編集機能
---
登録している曲について、編集することができます。その際に、ユーザーの手間を省くため登録時の情報が表示されるようになっています。

## ４. 曲の削除機能
---
登録している曲について、削除ボタンを押すことで曲を削除することができます。

## ５. 曲の検索機能
---
登録している曲について、検索ボクスでキーワード（曲のタイトル、歌手の名前、曲のカテゴリーなど）を検索ボタンを押すことで検索することができます。

## ６. コメント機能
---
登録している曲について、コメントをするというボタンや削除を押すことでコメントすることと削除することができます。

## ７. いいね機能
---
登録している曲について、いいねボタンやキャンセルを押すことでいいねすることといいねをキャンセルすることができます。


# テーブル設計
## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
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


# 工夫したポイント
・サムネイル表示

曲一覧の表示の際に、サムネイル表示が出るよう工夫いたしました。
ユーザーにとっては、サムネイルがある方がよりイメージがつきやすく分かりやすくなると考えたためどうしてもつけたい機能でした。

色々調べたところ、実装の方法はいくつも見つけましたが、どのやり方も、YoutubeのAPIを使う方法でした。
私は、単純にサムネイルの表示させたいだけであったため、他にもっといい方法があるではないかと思い、様々な方法を調べ、試しました。

その中で、サムネイルのURLは一部だけ変わるため、その部分だけを変数として使うことで、簡単なHTMLだけでもサムネイルが表示できることに気付きそのように実装をいたしました。


