class Gear < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :amazonUrl, length: { maximum: 255 }
  validates :image_url, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, length: { maximum: 10 }
  mount_uploader :image, ImageUploader
end
