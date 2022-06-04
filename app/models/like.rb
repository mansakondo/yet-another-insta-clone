class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :likeable, polymorphic: true, counter_cache: true
end
