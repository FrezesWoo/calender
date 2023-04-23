class User < ApplicationRecord
  acts_as_paranoid

  validates :user_type,:name,:phone, presence: true

  scope :is_partner, -> {where(user_type: 1)} # 是否合伙人
  scope :is_starter, -> {where(user_type: 2)} # 是否创业者
end
