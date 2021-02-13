class SessionsController < ApplicationController

    def new
    end

    def omniauth 
      user = User.create_from_omniauth(auth)
  
      if user.valid?
        session[:user_id] = user.id
        redirect_to user_path(current_user)
      else
        flash[:message] = @user.errors.full_messages.join(", ")
        redirect_to '/signin'
      end
    end

    def create
          @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = "Please Enter Valid Combination."
          redirect_to '/signin'
        end
      end

    def destroy
        session.delete(:user_id)
        redirect_to '/signin'
    end

    private
    def auth
      request.env['omniauth.auth']
    end
end