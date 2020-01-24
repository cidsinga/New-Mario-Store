class UsersController < ApplicationController
before_action :authorize, only: [:index, :show]
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      if current_user.admin === true
        flash[:notice] = "Welcome, Admin"
      else
        flash[:notice] = "You've successfully signed up!"
      end
      redirect_to "/products"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def destroy
  session[:user_id] = nil
  @user = User.find(params[:id])
  @user.destroy
  redirect_to '/'
end

  private

  def set_user
  @user = User.find(params[:id])
end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
  end
end
