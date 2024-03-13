module ArtistsHelper
  def define_badge_color(matching_percentage)
    puts matching_percentage
    if matching_percentage == 100
      'gold'
    elsif matching_percentage > 50
      'silver'
    elsif matching_percentage <= 50
      'bronze'
    end
  end
end
