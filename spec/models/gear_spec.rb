require 'rails_helper'

RSpec.describe Gear, type: :model do

  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@exmple.com') }

  describe 'FactoryBotが有効であること' do
    it 'user_aが有効であること' do
      expect(user_a).to be_valid
    end
  end

  it "タイトルとコンテンツとuser_idがあれば投稿できる" do
    user = user_a
    gear = user.gears.create(
      title: 'test',
      content: 'test_content'
    )
    expect(gear).to be_valid
  end

  it "タイトルがなければ投稿できない" do
    gear = Gear.create(title: nil)
    expect(gear).to_not be_valid
  end

  it "コンテンツがなければ投稿できない" do
    gear = Gear.create(content: nil)
    expect(gear).to_not be_valid
  end

  it "user_idがないと投稿できない" do
    gear = Gear.create(user: nil)
    expect(gear).to_not be_valid
  end

end