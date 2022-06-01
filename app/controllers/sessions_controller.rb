class SessionsController < ApplicationController
  before_action :authenticate, except: %i( new create )

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      cookies.encrypted[:user_id] = @user.id

      redirect_to root_url
    else
      User.new(user_params).tap do |invalid_user|
        invalid_user.validate

        errors = invalid_user.errors.full_messages << "Wrong username or password"

        redirect_to sign_in_path, flash: { errors: errors }
      end
    end
  end

  def destroy
    if cookies.encrypted[:user_id] == Current.user.id
      cookies.encrypted[:user_id] = nil

      Current.user = nil
    end

    redirect_to sign_in_path
  end

  private
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end
