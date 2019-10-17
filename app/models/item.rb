class Item < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :users, through: :ownerships
  has_many :wants, dependent: :destroy
  has_many :want_users, through: :wants, source: :user

  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :img_url, presence: true, length: { maximum: 255 }
end
