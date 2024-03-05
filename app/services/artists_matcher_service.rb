require "awesome_print"

class ArtistsMatcherService
  def initialize(audition)
    @audition = Audition.where(id: audition.id)
    @users = User.all
    @required_tags = @audition.joins(:audition_tags).where(audition_tags: {required: true}).map(&:tag_ids)
    @optional_tags = @audition.joins(:audition_tags).where(audition_tags: {required: false}).map(&:tag_ids).flatten
  end

    def call
      # 1. Find all users that have all the required tags
      @users = @users.joins(:tags).where(tags: { id: @required_tags })
      # 2. Return the users that match the audition with pourcentage of matching tags
      result = @users.map do |user|
        user_tags = user.tags.map(&:id)

        matching_tags = (user_tags & @optional_tags)

        matching_percentage = (matching_tags.count.to_f / @optional_tags.count) * 100
        {user: user, matching_percentage: matching_percentage}
      end
      return result.sort_by { |result| result[:matching_percentage] }.reverse
    end
  end
