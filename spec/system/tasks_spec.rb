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
      end

      it 'ユーザーＡが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
      end
    end
  end
end