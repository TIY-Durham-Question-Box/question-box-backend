class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    byebug
    @user.save
    redirect_to questions_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :password, :email)
    end
end
