require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前とメールアドレスとパスワードがあれば登録できる' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it '名前がなければ登録できない' do
    user = User.create(name: nil)
    user.valid?
    expect(user.errors[:name]).to include 'を入力してください'
  end

  it 'メールアドレスがなければ登録できない' do
    user = User.create(email: nil)
    user.valid?
    expect(user.errors[:email]).to include 'を入力してください'
  end

  it 'メールアドレスが重複していたら登録できない' do
    user1 = FactoryBot.create(:user)
    user = User.create(name: 'jiro', email: user1.email)
    user.valid?
    expect(user.errors[:email]).to include 'はすでに存在します'
  end

  it 'パスワードがなければ登録できない' do
    user = User.create(password: nil)
    user.valid?
    expect(user.errors[:password]).to include 'を入力してください'
  end

  it 'パスワードが暗号化されているか' do
    user = FactoryBot.create(:user)
    expect(user.password_digest).to_not eq 'password'
  end
end
