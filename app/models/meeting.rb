class Meeting < ApplicationRecord
  acts_as_paranoid

  belongs_to :scope

  scope :nonappointable, -> {where(status: 1)} # 不可预约的
  scope :appointable, -> {where(status: 2)} # 可预约的
end