# アプリケーション名

MemoTrace

# アプリケーションの概要

日々の学習や業務で得た知識、発生したエラーとその解決策を記録するためのWebアプリケーションです。通常メモとエラー記録の2つのモードでメモを管理でし、効率的に情報を蓄積・参照することができます。

# URL

https://memotrace.onrender.com/

# テスト用アカウント

- メールアドレス：test@test.com
- パスワード：password

# 利用方法

1. 新規登録
アプリケーションにアクセスし、新規登録を行います。

[新規登録](https://memotrace.onrender.com/users/sign_up)

2. ログイン
登録したメールアドレスとパスワード情報でログインします。

[ログイン](https://memotrace.onrender.com/users/sign_in)

3. メモ作成
ヘッダーの「新規作成」ボタンからメモを作成します。「通常メモ」と「エラー記録」の2つのモードを切り替えて、目的に応じた情報を記録できます。

[新規メモ作成](https://memotrace.onrender.com/memos/new)

4. メモ閲覧
ホーム画面には投稿した最新のメモが3件表示されます。ヘッダーの「一覧」からはすべてのメモを確認できます。

5. タグ検索
メモ一覧ページ上部の検索フォームにタグ名を入力するか、各メモに表示されているタグをクリックすることで関連するメモを絞り込んで表示できます。

[メモ一覧](https://memotrace.onrender.com/all_memos)

# 機能一覧

- ユーザー認証機能 (Devise)

- 通常メモの作成・編集・削除

- エラー記録の作成・編集・削除

- メモごとの画像添付機能

- メモ一覧の表示

- メモ投稿時のバリデーションとエラーメッセージの表示

- ヘッダーにログイン中のユーザー名を表示

- タグ検索機能
  - 特定のタグを含むメモを検索・絞り込めます。
  - 各メモに表示されているタグをクリックすることで関連メモを表示できます。

# アプリケーションを作成した背景

日々の学習や開発作業において、理解不足の部分や些細なことでもメモとして記録しておくことはとても大切です。特にエラーとその原因や解決策は今後同じエラーに遭遇した際に役立ちます。このアプリケーションはこれらの情報を効率的に記録・管理し、振り返りやすくするために作成しました。

# 実装予定の機能

- カレンダー機能：カレンダーから日付ごとのメモを振り返る機能。現状表示されている本日の日付をクリックすると当該月全体のカレンダーが表示され、メモを投稿した日にはマークもしくは投稿件数が視覚的に表示される。表示された内容をクリックすることでその日投稿したメモ一覧が表示される。

# 開発環境

## フロントエンド
- HTML
- CSS
- JavaScript

## バックエンド
- Ruby on Rails
- Ruby

## その他
- Git / GitHub
- Visual Studio Code

## データベーススキーマ

### users テーブル
ユーザー情報を管理します

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| id                 | bigint   | primary key               |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| create_at          | datetime | null: false               |
| update_at          | datetime | null: false               |

#### Association

- has_many :memos


### memos テーブル
ユーザーが投稿したメモ内容を管理します。投稿内容は「通常モード」と「エラー記録モード」があり、２種類の
入力項目があります。

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| id                 | bigint     | primary key                    |
| mode               | string     | null: false, unique: true      | ※ normal, error
| title              | string     | null: false                    | ※ 両モードで必死
| content            | text       | null: false                    | ※ 通常モードで必死
| error_content      | text       | null: false                    | ※ エラーモードで必死
| cause              | text       | null: false                    | ※ エラーモードで必死
| solution           | text       | null: false                    | ※ エラーモードで必死
| tag                | string     | null: false                    | ※ 両モードで必須
| user_id            | text       | null: false, foreing_key: true |
| create_at          | datetime   | null: false                    |
| update_at          | datetime   | null: false                    |

#### Association

- belong_to :user
- has_one_attached :image

# 工夫した点

1. UX向上

- モード切り替え：通常メモとエラー記録ごとにフォームを切り替えることで、ユーザーが迷わずに記録できるようにしました。

- 画像投稿時のプレビュー：画像添付時に、ファイル選択後すぐにプレビューが表示されるようにし、ユーザーが画像を確認できるようにしました。

- 投稿一覧の表示：全メモ一覧ページにおいて、通常メモとエラー記録をタブで切り替えて表示できるように実装し、ユーザーが目的のメモを探しやすく工夫しました。

- タグ検索：メモをタグで絞り込める検索窓と、各メモのタグをクリックして検索できる機能を実装し、ユーザーが情報を素早く見つけられるようにしました。

2. エラーハンドリング

- 視覚的なエラー表示：バリデーションエラーが発生した際に、画面上部にエラーメッセージを表示するのではなく、入力欄直下に分かりやすく表示することでユーザーがすぐに修正できるようにしました。