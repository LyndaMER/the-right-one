module ArtistsHelper
  def define_badge_color(matching_percentage)
    puts matching_percentage
    if matching_percentage >= 100
      "badge"
    elsif matching_percentage >= 80
      "badge-silver"
    else matching_percentage >= 50
      "badge-bronze"
    end
  end
end
