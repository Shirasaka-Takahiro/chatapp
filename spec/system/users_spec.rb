require 'rails_helper'

RSpec.describe 'user機能', type: :system do
  before do
    @user = FactoryBot.create(:user, username: 'userA', email: 'userA@example.com', password: 'password', password_confirmation: 'password') #ユーザーの作成

    visit user_session_path #ログイン画面に移動
    fill_in 'メールアドレス', with: 'userA@example.com' # メールアドレスを埋める
    fill_in 'パスワード', with: 'password' # パスワードを埋める
    click_button 'ログイン' # ログインする
    expect(page).to have_content 'ログインしました' #ログインに成功する
  end

  it 'ユーザーのプロフィールを編集する' do
   visit user_path(@user) # ユーザーのプロフィール画面に移動
   expect(page).to have_content 'userAさんのプロフィール' # プロフィール画面が表示されていることを確認 
   click_link '編集' # 編集ボタンを押す
   attach_file 'user_image', "#{Rails.root}/app/assets/images/no-image-icon-23500.jpg" # プロフィール画像 
   fill_in 'user_username', with: 'userA' # 名前
   fill_in 'user_profile', with: 'お初です' # 紹介文
   fill_in 'user_email', with: 'userA@example.com' # メールアドレス
   fill_in 'user_password', with: 'password' # パスワード
   fill_in 'user_password_confirmation', with: 'password' # 確認用パスワード
   click_button '更新' # 更新ボタンを押す
   expect(page).to have_content 'アカウント情報を変更しました' # 更新されたことを確認
  end

  it '退会する' do
   visit user_path(@user) # ユーザーのプロフィール画面に移動
   expect(page).to have_content 'userAさんのプロフィール' # プロフィール画面が表示されていることを確認 
   click_link '編集' # 編集ボタンを押す
   fill_in 'user_username', with: 'userA' # 名前
   fill_in 'user_profile', with: 'お初です' # 紹介文
   fill_in 'user_email', with: 'userA@example.com' # メールアドレス
   fill_in 'user_password', with: 'password' # パスワード
   fill_in 'user_password_confirmation', with: 'password' # 確認用パスワード
   click_button 'アカウント削除' # アカウント削除ボタンを押す
   page.driver.browser.switch_to.alert.accept # ダイアログの確認
   expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。' # 削除されたことを確認
  end

  it '新規登録する' do
   click_link 'ログアウト' # ログアウトする
   page.driver.browser.switch_to.alert.accept # ダイアログの確認
   expect(page).to have_content 'ログアウトしました' # ログアウトの確認
   click_link '新規登録' # 新規登録ボタンをおす
   fill_in 'user_username', with: 'pokepoke' # 名前
   fill_in 'user_email', with: 'poke@example.com' # メールアドレス
   fill_in 'user_password', with: 'password1' # パスワード
   fill_in 'user_password_confirmation', with: 'password1' # 確認用パスワード
   click_button 'アカウント登録' # アカウント登録ボタン
   expect(page).to have_content 'アカウント登録が完了しました。' # アカウント登録確認画面が表示される
  end

end

RSpec.describe '管理者機能', type: :system do
  before do
    @admin_user = FactoryBot.create(:user, username: 'admin', email: 'admin@example.com', password: 'password2', password_confirmation: 'password2', admin: true)
    @user = FactoryBot.create(:user, username: 'userA', email: 'userA@example.com', password: 'password', password_confirmation: 'password') #ユーザーの作成

    visit user_session_path #ログイン画面に移動
    fill_in 'メールアドレス', with: 'admin@example.com' # メールアドレスを埋める
    fill_in 'パスワード', with: 'password2' # パスワードを埋める
    click_button 'ログイン' # ログインする
    expect(page).to have_content 'ログインしました' #ログインに成功する
  end

  it '管理者画面' do
   click_link '管理者画面' # 管理者画面に移動
   expect(page).to have_content 'userA' # ユーザーAが表示される
   click_link '削除' # ユーザーAを削除する
   page.driver.browser.switch_to.alert.accept # ダイアログの確認
   expect(page).to have_content 'ユーザーuserAを削除しました。' # 削除されたことを確認
  end

end