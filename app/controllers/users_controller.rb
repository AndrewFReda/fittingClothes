class UsersController < ApplicationController
  before_action :check_auth, only: [:new, :login]

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to user_path(id: @user.id)
    else
      render new_user_path
    end
  end

  def login
  end

  def login_user
    @user = User.find_by(email: user_params[:email])
    if @user and @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to(user_path(id: @user.id), notice: "Welcome back, #{@user.email}")
    else
      @user = User.new
      flash[:alert] = 'Invalid email or password'
      render login_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  def check_auth
    if current_user
      redirect_to(user_path(id: session[:user_id]))
    else
      @user = User.new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :password_digest, :login)
    end

end
