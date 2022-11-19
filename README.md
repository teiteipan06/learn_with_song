#テーブル設計

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
| lyric_other     | text       | null: false                    |
| lyric_japanese  | text       | null: false                    |
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