class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

  before_action :set_user, only:[:show,:edit,:update,:destroy ]

  def index
    @users = User.all
    # rendor json: @user
  end
  
  def show
  end

  
  def new
    @user = User.new
  end

     
  def edit
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      # render json: @user 
      render json: @user
      UserMailer.signup_confirmation(user.email, user).deliver_now
      # redirect_to users_path, notice: "User was successfully created." 
    end
  end

  
  def update
    if @user.update(user_params)
      render json: @user , status: :ok
      # redirect_to users_path, notice: "User was successfully updated." 
    end
  end


  def destroy
    if @user.destroy
      render json: @user
      # redirect_to users_path, notice: "User was successfully destroyed." 
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end