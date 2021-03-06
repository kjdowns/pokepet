module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])  if  !!session[:user_id]
    end

    def require_login
      redirect_to root_path unless session.include? :user_id
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
      
end
