class UsersController < ApplicationController
  before_action :authenticate, except: %i( new create )

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      cookies.encrypted[:user_id] = @user.id

      redirect_to root_url
    else
      redirect_to new_user_path, flash: { errors: @user.errors.full_messages }
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    @user.destroy

    redirect_to new_user_path
  end

  private
    def user_params
      params.require(:user).permit(:id, :username, :password, :password_confirmation)
    end
end
