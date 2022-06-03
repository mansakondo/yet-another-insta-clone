class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :comments, -> { includes(:author) },
    dependent: :destroy

  accepts_nested_attributes_for :comments
end
