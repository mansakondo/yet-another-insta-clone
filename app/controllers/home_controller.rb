class HomeController < ApplicationController
  def show
    @posts = Post.includes(:author).order(created_at: :desc)
  end
end
