class Audition < ApplicationRecord
  belongs_to :user
  has_many :audition_tags, dependent: :destroy
  has_many :tags, through: :audition_tags
end
