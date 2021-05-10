# テーブル設計
# アプリケーション名
- Usersvoice

# アプリケーション概要
- 

# URL
- https://uservoice.herokuapp.com/

# 利用方法
- 

# 目指した課題解決
- 

# バージョン
- Ruby : 2.6.5
- Rails : 6.0.0


## usersテーブル

| Column                 | Type       | Options                  |
| ---------------------- | ---------- | ------------------------ |
| email                  | string     | null: false,unique: true |
| encrypted_password     | string     | null: false              |
| nickname               | string     | null: false              |
| age                    | integer    | null: false              |  ##ActiveHash使う
| image_name             | string     |                          |  
| profile                | text       |                          |  

### Association
- has_many  :posts
- has_many  :likes


## postsテーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- | ----------------------------- |
| user                       | references | null: false,foreign_key: true |
| item                       | text       | null: false                   |
| content                    | text       | null: false                   |

### Association
- belongs_to :user
- has_many   :likes


## likesテーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- | ----------------------------- |
| user                       | references | null: false,foreign_key: true |
| item                       | references | null: false,foreign_key: true |
| content                    | text       | null: false                   |

### Association
- belongs_to :user
- belongs_to :post