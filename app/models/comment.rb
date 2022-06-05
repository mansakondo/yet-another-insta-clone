class Comment < ApplicationRecord
  include Likeable

  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: "User"
end
