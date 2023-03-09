class SessionsController < ApplicationController

  def new
  end

  
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end



