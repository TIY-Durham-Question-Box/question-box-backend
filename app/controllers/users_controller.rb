class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    # byebug
    # @user.save
    if @user.save
      render json: { message: "created" }, status: :created
    else
      render json: {
        errors: @user.errors
      }, status: :bad_request
    end
  end

  def login
     user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

     # Same as above
     # user = User.find_by(email: params[:email])
     # if !user.nil?
     #   user = user.authenticate(params[:password])
     # end

     if !user
       render status: :unauthorized, json: {
         "error": "There is no user with that email and password."
       }
     else
       render json: {token: user.token}
     end
  end


  private
    def user_params
      params.require(:user).permit(:username, :name, :password, :email)
    end
end
