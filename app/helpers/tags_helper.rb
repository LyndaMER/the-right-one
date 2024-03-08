module TagsHelper
  def available_tags
    Tag.pluck(:name).uniq.push('Selectionner un critère').reverse
  end
end
