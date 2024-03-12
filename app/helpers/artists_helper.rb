module ArtistsHelper

  def define_badge_color(matching_percentage)
    if matching_percentage > 80
      "badge-success"
    elsif matching_percentage > 50
      "badge-warning"
    else
      "badge-danger"
    end
  end
end
