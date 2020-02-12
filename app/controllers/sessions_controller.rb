class SessionsController < ApplicationController
    
    def home
        
    end

    def signin
        @user = User.new
    end

    def create
        @user = User.find_by(params[:user_name])
        if @user.authenticate
            session[:user_id] = @user.id
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end