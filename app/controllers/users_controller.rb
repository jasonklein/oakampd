class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :role)
  end
end
