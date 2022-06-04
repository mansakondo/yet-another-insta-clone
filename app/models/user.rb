class User < ApplicationRecord
  has_secure_password

  has_many :follows_as_follower,
    class_name: "Follow",
    foreign_key: "follower_id",
    counter_cache: :followings_count

  has_many :follows_as_followed,
    class_name: "Follow",
    foreign_key: "followed_id",
    counter_cache: :followers_count

  has_many :followers,
    through: :follows_as_followed

  has_many :followings,
    through: :follows_as_follower,
    source: :followed

  validates :username, presence: true

  def likes?(likeable)
    likes = likeable.likes.to_a

    likes.find { |like| like.author == self }
  end

  def follows?(user)
    followings.to_a.find do |following|
      following == user
    end
  end
end
