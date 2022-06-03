class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])

    detect_editable_comment
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(**post_params, author: Current.user)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      if @post.author == Current.user
        redirect_back_or_to edit_post_path(@post)
      else
        redirect_back_or_to @post
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to root_url
  end

  private
    def post_params
      params.require(:post).permit(:id, :title, :content, comments_attributes: [:id, :content, :author_id])
    end

    def detect_editable_comment
      if params[:editable_comment_id] && (comment = Comment.find(params[:editable_comment_id]))
        if (comment.post == @post) && (comment.author == Current.user)
          @editable_comment = comment
        end
      end
    end
end
