class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]
   
  
      # def create
      #   @user = User.find_by(email: session_params[:email])
      #   if @user && @user.authenticate(session_params[:password])
      #     token = encode_token({ user_id: @user.id })
      #     render json: { user: @user, jwt: token, logged_in: true}, status: :accepted
      #   else
      #     render json: { message: 'Invalid username or password' }, status: :unauthorized
      #   end
      # end
  
      # def is_logged_in?
      #     if logged_in? && current_user
      #       render json: {
      #         logged_in: true,
      #         user: current_user
      #       }
      #     else
      #       render json: {
      #         logged_in: false,
      #         message: 'no such user'
      #       }
      #     end
      #   end
      # def destroy
      #     logout!
      #     render json: {
      #       status: 200,
      #       logged_out: true
      #     }
      #   end
      # private
      # def session_params
      #     params.require(:user).permit(:username, :email, :password, :logged_in)
      #   end
      end