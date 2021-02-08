class JobsController < ApplicationController
    
    def index
      # if params[:recruiter_id]
      #   @jobs = Recruiter.find(params[:recruiter_id]).jobs
      # else
      @jobs = Job.all
      # end
    end

    def shows
      @job = Job.find(params[:id])
    end

    def edit 
      @job = Job.find_by(params[:id])
    end

    def new
        @job = Job.new
    end

    def create 
        @job = Job.new(job_params)
        if @job.valid?
          @job.save
          redirect_to job_path(@job)
        else
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
        Job.find(params[:id]).delete
        redirect_to job_path
    end
    
      private
    
      def job_params
        params.require(:job).permit(:title, :description)
      end
    
end
