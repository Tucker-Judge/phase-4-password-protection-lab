class UsersController < ApplicationController
    before_action :authenticate, only: [:show]
    def create
        user = User.create(new_user)
        if user.valid?
        session[:user_id] = user.id
        render json: user
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end
    def show 
        if session[:user_id]
            user = User.find(session[:user_id])
            render json: user
        end
    end
private
    def new_user
        params.permit(:user_id, :password, :password_confirmation)
    end
    def authenticate
        return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    end
end
