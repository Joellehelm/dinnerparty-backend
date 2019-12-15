class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
end


def show
    @user = User.find(params[:id])
   if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end
  
def new
  @user = User.new(user_params)
end


  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token, status: :created}
    else
      render json: { error: 'failed to create user', status: :not_acceptable}
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end