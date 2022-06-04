module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, -> { includes(:author) },
      as: :likeable,
      dependent: :destroy

    def find_like_by_author(author)
      likes.to_a.find do |like|
        like.author == author
      end
    end
  end
end
