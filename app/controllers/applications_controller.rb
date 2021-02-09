class ApplicationsController < ApplicationController
  
    def index
        if params[:job_id]
      @applications = Job.find(params[:job_id]).applications
        else
      @applications = Application.all
        end
    end

    def show
        @application = Application.find(params[:id])
    end

    def new
        @application = Application.new
    end

    def create 
        @application = Application.new(application_params)

        if @application.valid?
        @application.save
            redirect_to application_path(@application)
        else
            render :new
        end
    end

    def edit 
        @application = Application.find_by(params[:id])
    end

    def update
        @application = Application.find(params[:id])
        if @application.update(application_params)
          redirect_to application_path(@application)
        else
          render :edit
        end
    end
      
    def destroy
        application = Application.find(params[:id])
        application.destroy
        redirect_to application_path
    end
    
      private
    
    def application_params
        params.require(:application).permit(:title, :description, :experience)
    end

end
