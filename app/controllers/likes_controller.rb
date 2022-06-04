class LikesController < ApplicationController
  def create
    likeable_class = params[:likeable_type].constantize
    likeable       = likeable_class.find(params[:likeable_id])
    likes          = likeable.likes

    likes.create(author: Current.user)

    redirect_back_to_anchor likeable, fallback_location: likeable
  end

  def destroy
    like     = Like.find(params[:id])
    likeable = like.likeable

    like.destroy

    redirect_back_to_anchor likeable, fallback_location: likeable
  end
end
