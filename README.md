# アプリケーション名
- Uservoice

# アプリケーション概要
- もらって嬉しかったノベルティを投稿し、いいね・コメント機能で
  他のユーザーとコミュニケーションを取ることができる。

# URL
- https://uservoice.herokuapp.com/

# テスト用アカウント
- email: test1111@test.com
- password: aaaaaa1

# 使用方法
- 投稿記事への「いいね機能」「コメント機能」を利用される場合は、
  投稿一覧から記事をクリックすると詳細画面へ遷移します。

# 解決したい課題
- ノベルティは、エンドユーザーの反応が分かりづらく、どのような物が求められ、
  販促効果を把握しづらいとう課題があった。
  その課題を解決する為に、もらって嬉しかったノベルティを投稿してもらい、
  そこでのコメントや「いいね！」の数から、消費者に支持れるアイテムを検証し、
  消費者に喜ばれ、販促効果の高い商品を作りたい。

# 実装予定の機能
- ユーザー詳細ページ(ユーザーの投稿記事といいねした記事が一覧で見ることができる)
- 投稿記事検索機能(キーワードから投稿記事を検索する)

# バージョン
- Ruby : 2.6.5
- Rails : 6.0.0
- mysql2 :0.4.4

## usersテーブル

| Column                 | Type       | Options                  |
| ---------------------- | ---------- | ------------------------ |
| email                  | string     | null: false,unique: true |
| encrypted_password     | string     | null: false              |
| nickname               | string     | null: false              |
| age                    | integer    | null: false              |  
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


## commentsテーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- | ----------------------------- |
| user                       | references | null: false,foreign_key: true |
| post                       | references | null: false,foreign_key: true |
| comment_content            | text       | null: false                   |

### Association
- belongs_to :user
- belongs_to :post