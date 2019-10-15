require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーＡを作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザーＡ', email: 'a@example.com')
      # 作成者がユーザーＡであるタスクを作成しておく
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end
  
    context 'ユーザーＡがログインしているとき' do
      before do
        # ユーザーＡでログインする
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーＡが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーＢがログインしているとき' do
      before do
        # ユーザーＢを作成しておく
        FactoryBot.create(:user, name: 'ユーザーＢ', email: 'b@example.com')
        # ユーザーＢでログインする
        visit login_path
        fill_in 'メールアドレス', with: 'b@example.com'
        fill_in 'パスワード', with: 'password'
        click_button
      end

      it 'ユーザーＡが作成したタスクが表示されない' do
        # ユーザーＡが作成したタスクの名称が画面上に表示されていない事を確認
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end
end