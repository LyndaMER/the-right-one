class Tag < ApplicationRecord
  has_many :audition_tags, dependent: :destroy
  has_many :user_tags, dependent: :destroy
end
