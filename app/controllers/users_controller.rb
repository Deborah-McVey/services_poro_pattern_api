class UsersController < ApplicationController
  def index
    users = UserService::Base.filter_users(params)
    #render json: users, status: :ok
    render json: result.payload, status: :ok
  end

  def create
    #user = User.new(user_params)
    #if user.save
    #user = UserService::Base.create_user(user_params)
    #if user.valid?
      #render json: user, status: :created
      result = UserService::Base.create_user(user_params)
    if result.success?
      render json: result.payload, status: :created  
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
