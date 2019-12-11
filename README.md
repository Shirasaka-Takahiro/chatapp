<h3>『概要』</h3>

誰でも参加できるチャットアプリ

<h3>『機能一覧』</h3>

・チャット機能
・ルーム機能（削除機能もあり）
・画像アップロード機能
・ページネーション機能
・ログイン、新規登録機能
・管理者ユーザー機能(登録者一覧が利用可能)
・マイページ機能(自らのプロフィールを表示)

<h3>『技術一覧』</h3>

・Ruby on Rails -v 6.0.0
・Actioncable
・Heroku
・bootstrap
・development環境 -> sqlite3
・pruduction環境 -> PostgreSQL
・Devise i18n(locales)
・rmagic（プロフィールの画像アップロード)
・font-awesome-rails
・Kaminari(ページネーション機能)
・Devise(loginなどの認証機能)
・Faker

環境構築 -> Virtual Box + Vagrant
テスト -> Capybara + RSpec

<h3>『工夫した点』</h3>
・誰もが参加出来るように、グループ部屋を作らないようにしました。
・Room削除機能は管理者ユーザーのみ出来るようにしました。
・管理者ユーザーによるユーザー削除機能を実装しました。
