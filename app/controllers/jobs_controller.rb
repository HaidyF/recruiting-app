class JobsController < ApplicationController
  # before_filter :authorize_admin, only: :create

    def index
      # if params[:recruiter_id]
      #   @jobs = Recruiter.find(params[:recruiter_id]).jobs
      # else
      @jobs = Job.ordered_by_title
      # end
    end

    def show
      @job = Job.find_by(:id => params[:id])
    end

    def edit 
      @job = Job.find_by(:id => params[:id])
    end

    def new
        @job = Job.new  
        flash[:message] = @job.errors.full_messages.join(", ")  
    end

    def create 
        @job = Job.new(job_params)
        if @job.valid?
          @job.save
          
          redirect_to job_path(@job)
        else
          flash[:message] = @job.errors.full_messages.join(", ")  
          render :new
        end
    end

    def update
        @job = Job.find(params[:id])
        if @job.update(job_params)
          redirect_to job_path(@job)
        else
          render :edit
        end
    end
      
    def destroy
        job = Job.find(params[:id])
        job.destroy
        redirect_to '/'
    end
    
      private
    
      def job_params
        params.require(:job).permit(:title, :description, :experience)
      end
    
end
