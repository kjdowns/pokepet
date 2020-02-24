class SessionsController < ApplicationController

    def google
        @user = User.find_or_create_by(user_name: auth['info']['email']) do |u|
            u.password = auth['uid']
        end
        session[:user_id] = @user.id
        
        redirect_to user_path(current_user)
    end

    def create
        @user = User.find_by(user_name: params[:user_name])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        else
            message = "Something went wrong! Make sure your username and password are correct and try again."
            redirect_to signin_path, notice: message
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
     
      def auth
        request.env['omniauth.auth']
      end

end