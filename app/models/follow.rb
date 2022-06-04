class Follow < ApplicationRecord
  belongs_to :follower,
    class_name: "User",
    counter_cache: :followings_count

  belongs_to :followed,
    class_name: "User",
    counter_cache: :followers_count
end
