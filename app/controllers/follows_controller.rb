class FollowsController < ApplicationController
  def create
    followed = User.find(params[:followed_id])

    Current.user.followings << followed

    redirect_back_or_to followed
  end

  def destroy
    followed = User.find(params[:followed_id])
    follow   = Follow.find_by(follower: Current.user, followed: followed)

    follow.destroy

    redirect_back_or_to followed
  end
end
