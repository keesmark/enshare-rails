FactoryBot.define do
  factory :gear do
    title { 'テストタイトル' }
    amazonUrl { 'https://amazon.co.jp/' }
    content { 'テストコンテンツ' }
    user
  end
end