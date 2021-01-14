# frozen_string_literal: true

module UserDecorator
    
  def display_name
    profile&.name || "unknown"
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  def posts_count
    posts.published.count
  end

  def has_bookmarked_posts_count
    bookmarked_posts.published.count
  end

  def following_count
    followings.count
  end

  def follower_count
    followers.count
  end
end
