class UsersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

      def new
          @user = User.new
      end
  
      def create
        @user = User.create(user_params)
        if @user.valid?
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
      end
    
      def show
        @user = User.find_by(:id => params[:id])
        @applications = Application.where(user_id: @user.id)
  
        if session[:user_id] != @user.id
          redirect_to '/signin'
        end
      end

      def edit 
        @user = User.find_by(:id => params[:id])
      end
      
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user)
        else
          redirect_to '/users'
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to '/'
      end
    
      private
      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :recruiter)
      end
end
