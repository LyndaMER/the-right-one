class Tag < ApplicationRecord
  has_many :audition_tags, dependent: :destroy
  has_many :user_tags, dependent: :destroy

  def index
    @tags = Tag.all
  end

  def tags
    @tags = Tag.all
  end
end
