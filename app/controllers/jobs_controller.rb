class JobsController < ApplicationController
    def index
        @jobs = Job.all
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
end
