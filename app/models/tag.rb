class Tag < ApplicationRecord
  has_many :audition_tags
  has_many :user_tags
end
