class Gear < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :amazonUrl, length: { maximum: 255 }
  validates :imgUrl, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
end
