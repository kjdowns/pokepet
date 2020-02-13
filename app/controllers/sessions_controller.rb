class SessionsController < ApplicationController
    
    def home
        
    end

    def signin
        @user = User.new
    end

    def create
        @user = User.find_by(user_name: params[:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end