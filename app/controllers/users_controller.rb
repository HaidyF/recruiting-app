class UsersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
      def index
        @users = User.all
      end

      def new
        @user = User.new
      end
    
      def create
        @user = User.create(user_params)
        if @user.valid?
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = @user.errors.full_messages.join(", ")  
          render :show
        end
      end
    
      def show
        @user = User.find_by(:id => params[:id])
      end

      def edit 
        @user = User.find_by(:id => params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user)
        else
          flash[:message] = @user.errors.full_messages.to_(", ")  
          render :edit
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to '/'
      end
    
      private
      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
      end
end
