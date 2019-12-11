require 'rails_helper'

RSpec.describe 'room機能', type: :system do
    before do
        @admin_user = FactoryBot.create(:user, username: 'admin', email: 'admin@example.com', password: 'password2', password_confirmation: 'password2', admin: true)
        @user = FactoryBot.create(:user, username: 'userA', email: 'userA@example.com', password: 'password', password_confirmation: 'password') #ユーザーの作成
        @room = FactoryBot.create(:room)

    end

    context 'adminでログインしている' do
      before do
        visit user_session_path #ログイン画面に移動
        fill_in 'メールアドレス', with: 'admin@example.com' # メールアドレスを埋める
        fill_in 'パスワード', with: 'password2' # パスワードを埋める
        click_button 'ログイン' # ログインする
        expect(page).to have_content 'ログインしました' #ログインに成功する
      end

      it 'Roomを作成、削除する' do
        click_link '新規ルームを作成する'  # Roomを作成する
        expect(page).to have_content '新規ルームを作成しました。'  # 作成されたことを確認
        visit room_path(@room)  # Roomに入る
        expect(page).to have_content 'Chat Room No.1'  # Roomの名前があることを確認
        click_link 'Roomを削除'  # Roomを削除する
        page.driver.browser.switch_to.alert.accept # ダイアログの確認
        expect(page).to have_content 'Room1を削除しました。'  # 削除されたことを確認
      end

    end

    context 'userAでログインしている' do
      before do
        visit user_session_path #ログイン画面に移動
        fill_in 'メールアドレス', with: 'userA@example.com' # メールアドレスを埋める
        fill_in 'パスワード', with: 'password' # パスワードを埋める
        click_button 'ログイン' # ログインする
        expect(page).to have_content 'ログインしました' #ログインに成功する
      end

      it 'Room削除ボタンが表示されない' do
        visit room_path(@room) #Roomに入る
        expect(page).not_to have_content 'Roomを削除' # Room削除ボタンが表示されない
      end

    end

end