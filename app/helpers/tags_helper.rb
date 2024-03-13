module TagsHelper
  def available_tags
    Tag.order(:name).pluck(:name).uniq
  end
end
