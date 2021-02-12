class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper
    helper_method :current_user
    helper_method :admin?
    helper_method :logged_in?
    helper_method :authorize_admin

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def admin?
        current_user.recruiter
    end

    def logged_in?
        current_user != nil
    end 

    def authorize_admin
        redirect_to '/signin', alert: 'Access Denied' unless admin?
    end
    
end
