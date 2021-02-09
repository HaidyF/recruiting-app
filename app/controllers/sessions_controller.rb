class SessionsController < ApplicationController

    def new
        @user=User.new
    end

    def omniauth 
      user = User.create_from_omniauth(auth)
      if user.save
        session[:user_id] = user.id
        redirect_to new_user_path
      else
        redirect_to users_path
      end
    end

    def create
        @user = User.find_by(name: user_params[:name])
        if @user && @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
      end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to '/'
    end

    private
    def auth
      request.env['omniauth.auth']
    end
end