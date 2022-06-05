class Post < ApplicationRecord
  include Likeable

  belongs_to :author, class_name: "User"

  has_many :comments, -> { includes(:author, :likes).order(created_at: :asc) },
    dependent: :destroy

  accepts_nested_attributes_for :comments

  has_one_attached :media

  attribute :youtube_url, YouTubeURLType.new
end
