class ApplicationsController < ApplicationController
  
    def index
        if params[:job_id]
      @application = Job.find(params[:job_id]).applications
        else
      @applications = Application.all
        end
    end

    def show
        @application = Application.find(params[:id])
    end

    def new
        if params[:job_id]
            @job = Job.find_by(params[:job_id])
           @application = @job.applications.build
        else
            flash[:message] = @application.errors.full_messages.join(", ") 
            @application = Application.new
        end
    end

    def create 
        user = User.find_by(id: session[:user_id])
        @application = user.applications.build(application_params)

        if @application.valid?
        @application.save
            redirect_to application_path(@application)
        else
            render :new
        end
    end

    def edit 
        @application = Application.find_by(:id => params[:id])
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
        redirect_to '/'
    end
    
      private
    
    def application_params
        params.require(:application).permit(:title, :description, :experience, :job_id)
    end

end
