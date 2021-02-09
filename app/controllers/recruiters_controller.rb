class RecruitersController < ApplicationController
    def index
        @recruiters = Recruiter.all
    end

    def new
        @recruiter = Recruiter.new
    end

    def show
      @recruiter = Recruiter.find(params[:id])
    end

    def edit 
      @recruiter = Recruiter.find_by(params[:id])
    end

    def create 
        @recruiter = Recruiter.new(recruiter_params)

        if @recruiter.valid?
          @recruiter.save
          redirect_to recruiter_path(@recruiter)
        else
          flash[:message] = @recruiter.errors.full_messages.to_(", ")  
          render :new
        end
    end

    def update
        @recruiter = Recruiter.find(params[:id])
        if @recruiter.update(recruiter_params)
          redirect_to recruiter_path(@recruiter)
        else
          flash[:message] = @recruiter.errors.full_messages.to_(", ")  
          render :edit
        end
      end
      
    def destroy
        recruiter = Recruiter.find(params[:id])
        recruiter.destroy
        redirect_to recruiter_path
    end
    
      private
    
      def recruiter_params
        params.require(:recruiter).permit(:title, :description)
      end
  
end
