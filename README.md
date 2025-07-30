## users テーブル
ユーザー情報を管理します

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| id                 | bigint   | primary key               |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| create_at          | datetime | null: false               |
| update_at          | datetime | null: false               |

### Association

- has_many :memos


## memos テーブル
ユーザーが投稿したメモ内容を管理します。投稿内容は「通用モード」と「エラー記録モード」があり、２種類の
入力項目があります。

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| id                 | bigint     | primary key                    |
| mode               | string     | null: false, unique: true      | ※ normal, error
| title              | string     | null: false                    | ※ 通常モードで必死
| content            | text       | null: false                    | ※ 通常モードで必死
| error_content      | text       | null: false                    | ※ エラーモードで必死
| cause              | text       | null: false                    | ※ エラーモードで必死
| solution           | text       | null: false                    | ※ エラーモードで必死
| tag                | string     | null: false                    | ※ 両モードで必須
| user_id            | text       | null: false, foreing_key: true |
| create_at          | datetime   | null: false                    |
| update_at          | datetime   | null: false                    |

### Association

- belong_to :user
- has_one_attached :image