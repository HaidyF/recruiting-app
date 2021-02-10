class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper

    # def authorize_admin
    #     return unless !current_user.admin?
    #     redirect_to root_path, alert: 'Admins only!'
    # end
end
