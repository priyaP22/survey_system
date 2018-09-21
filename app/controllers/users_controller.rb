class UsersController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user
      session[:user_id] = user.id
    else
      session[:user_id] = User.create(user_params).id
    end
    redirect_to :back
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
