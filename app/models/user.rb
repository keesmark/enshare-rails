class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :gears, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :user
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_gears, through: :favorites, source: :gear
  has_many :ownerships, dependent: :destroy
  has_many :items, through: :ownerships
  has_many :wants, dependent: :destroy
  has_many :want_items, through: :wants, source: :item

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def favorite?(gear)
    favorite_gears.include?(gear)
  end

  def unfavorite(gear)
    favorite = favorites.find_by(gear_id: gear.id)
    favorite&.destroy
  end

  def want(item)
    wants.find_or_create_by(item_id: item.id)
  end

  def unwant(item)
    want = wants.find_by(item_id: item.id)
    want&.destroy
  end

  def want?(item)
    want_items.include?(item)
  end
end
