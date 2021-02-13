class JobsController < ApplicationController
   before_action :authorize_admin, except: [:index, :show]

    def index
      @jobs = Job.ordered_by_title
    end

    def show
      @job = Job.find_by(:id => params[:id])
      @comments = Comment.where(job_id: @job.id)
    end

    def edit 
      @job = Job.find_by(:id => params[:id])
    end

    def new
        @job = Job.new   
    end

    def create 
        # @job = current_user.jobs.build(job_params)
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
        job = Job.find(params[:id])
        job.destroy
        redirect_to '/'
    end
    
      private
    
      def job_params
        params.require(:job).permit(:title, :description, :experience)
      end
    
end
