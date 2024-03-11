class Audition < ApplicationRecord
  belongs_to :user
  has_many :audition_tags, dependent: :destroy
  has_many :tags, through: :audition_tags

  def audition_tags_attributes=(audition_tags_attributes)
      audition_tags_attributes.each do |i, audition_tag_attributes|
      self.audition_tags.build(audition_tag_attributes)
    end
  end
end
