require 'rails_helper'

describe 'ギア投稿機能テスト', type: :system do
  let(:user1) { FactoryBot.create(:user, name: 'ユーザ1') }
  let(:user2) { FactoryBot.create(:user, name: 'ユーザ2') }

  describe 'ギア投稿情報' do
    before do
      visit signin_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      visit new_gear_path
    end
    context 'ギアの投稿' do
      let(:login_user) { user1 }
      context '有効な入力をしたイベントの場合' do
        it '登録成功のメッセージが表示されること' do
          fill_in 'タイトル', with: 'テストタイトル'
          fill_in 'レビューやコメント', with: 'テストのコンテンツ'
          click_button '投稿'
          expect(page).to have_content('ギアを投稿しました。')
        end
      end
    end
  end

  describe 'ギアの編集と削除' do
    let(:gear) { FactoryBot.create(:gear, user: user1) }
    let(:login_user) { user1 }
    before do
      visit signin_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      visit edit_gear_path(gear.id)
    end
    context '有効な入力をした場合' do
      it '登録成功のメッセージが表示されること' do
        click_button '投稿'
        expect(page).to have_content('ギアは正常に更新されました')
      end
    end
    context '無効な入力した場合' do
      it '不正な入力のメッセージが表示されること' do
        fill_in 'タイトル', with: nil
        click_button '投稿'
        expect(page).to have_content('ギアは更新されませんでした')
      end
    end
  end
end
