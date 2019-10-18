class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validates :gear_id, presence: true
  validates :user_id, uniqueness: { scope: :gear_id }
end
