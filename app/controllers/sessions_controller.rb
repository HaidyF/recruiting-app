class SessionsController < ApplicationController
    def welcome
        @user = current_user
    end

    def new
        @user=User.new
    end

    def create
        @user = User.find_by(email: user_params[:email])
        
        if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
        flash[:notice] = "Login is incorrect"
        render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end