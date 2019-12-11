require 'rails_helper'

RSpec.describe 'message機能', type: :system do
  before do
    @user = FactoryBot.create(:user, username: 'userA', email: 'userA@example.com', password: 'password', password_confirmation: 'password') #ユーザーの作成
    @admin_user = FactoryBot.create(:user, username: 'admin', email: 'admin@example.com', password: 'password2', password_confirmation: 'password2', admin: true)  
    @room = FactoryBot.create(:room)
  end

  context 'ユーザーAでログイン' do
    before do
      visit user_session_path #ログイン画面に移動
      fill_in 'メールアドレス', with: 'userA@example.com' # メールアドレスを埋める
      fill_in 'パスワード', with: 'password' # パスワードを埋める
      click_button 'ログイン' # ログインする
      expect(page).to have_content 'ログインしました' #ログインに成功する
      visit room_path(@room) # Room1に入る
      expect(page).to have_content 'Chat Room No.1'
    end

    it 'メッセージを送信する', js: true do
      fill_in 'content', with: 'MyText'  # メッセージする
      find('input[name="content"]').send_keys(:enter)
      expect(page).to have_content 'MyText' # 送信されたか確認する
    end

  end

end