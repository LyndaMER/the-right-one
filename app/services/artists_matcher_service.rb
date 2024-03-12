require "awesome_print"

class ArtistsMatcherService
  def initialize(audition)
    @audition = audition
    @users = User.not_admin
    @required_tags = @audition.audition_tags.where(required: true).map(&:tag_id).flatten.uniq
    @optional_tags = @audition.audition_tags.where(required: false).map(&:tag_id).flatten.uniq
  end

  def call
    # 1. Find all users that have all the required tags
    ap @required_tags
    @good_users = User.joins(:tags)
                        .where(tags: { id: @required_tags })
                        .group("users.id")
                        .having("COUNT(DISTINCT tags.id) = ?", @required_tags.count)
    ap @users.map(&:id)
    ap @good_users.map(&:id)
    # 2. Return the users that match the audition with pourcentage of matching tags
    results = @good_users.map do |user|
      user_tags = user.tags.map(&:id)
      all_tags = @optional_tags + @required_tags
      matching_tags = (user_tags & all_tags).uniq
      matching_percentage = (matching_tags.count.to_f / all_tags.count) * 100
      { user: user, matching_percentage: matching_percentage }
    end
    results.sort_by { |result| result[:matching_percentage] }.reverse
  end
end

# class ArtistsMatcherService
#   def initialize(audition)
#     @audition = audition
#     @users = User.all
#     @required_tags = audition.audition_tags.where(required: true).pluck(:tag_id)
#     @optional_tags = audition.audition_tags.where(required: false).pluck(:tag_id).uniq
#   end

#   def call
#     # Find all users that have all the required tags
#     users_with_required_tags = User.joins(:tags).where(tags: { id: @required_tags })

#     # Return the users that match the audition with percentage of matching tags
#     result = users_with_required_tags.map do |user|
#       user_tags = user.tags.pluck(:id)
#       matching_tags = user_tags & @optional_tags

#       matching_percentage = (matching_tags.count.to_f / @optional_tags.count) * 100
#       { user: user, matching_percentage: matching_percentage }
#     end

#     result.sort_by { |result| result[:matching_percentage] }.reverse
#   end
# end
#   def call
#     # Find users with all required tags
#   users_with_all_required_tags = User.joins(:tags)
#                                       .where(tags: { id: @required_tags })
#                                       .group("users.id")
#                                       .having("COUNT(DISTINCT tags.id) = ?", @required_tags.count)

#   # Return the users that match the audition with percentage of matching tags
#   result = users_with_all_required_tags.map do |user|
#     user_tags = user.tags.where(id: @required_tags).pluck(:id)
#     matching_percentage = calculate_matching_percentage(user_tags)

#     { user: user, matching_percentage: matching_percentage }
#   end

#   result.sort_by { |result| result[:matching_percentage] }.reverse
#   end

#   private

#   def calculate_matching_percentage(user_tags)
#     matching_tags = user_tags & @optional_tags
#     (matching_tags.count.to_f / @optional_tags.count) * 100
#   end
# end
