class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true

  def likes?(likeable)
    likes = likeable.likes.to_a

    likes.find { |like| like.author == self }
  end
end
