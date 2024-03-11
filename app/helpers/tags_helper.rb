module TagsHelper
  def available_tags
    Tag.pluck(:name).uniq
  end
end
