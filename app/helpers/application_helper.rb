module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def admin?
        if current_user
            current_user.recruiter
        end
    end

    def logged_in?
        current_user != nil
    end 

    def authorize_admin
        redirect_to '/signin', alert: 'Access Denied' unless admin?
    end
end
