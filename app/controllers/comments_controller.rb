class CommentsController < ApplicationController
    def index
      if params[:job_id]
        @comments = Job.find(params[:job_id]).comments
      else
        @comments = Comment.all
      end
    end

    def new
      if params[:job_id]
      @job = Job.find(params[:job_id])
      @comment = @job.comments.build
    else
        flash[:message] = @comment.errors.full_messages.join(", ")  
        @comment = Comment.new
    end
    end

    def show
      @comment = Comment.find_by(:id => params[:id])
    end

    def create 
      user = User.find_by(id: session[:user_id])
      @comment = user.comments.build(comment_params)

        if @comment.valid?
          @comment.save
          redirect_to comment_path(@comment)
        else
            flash[:message] = @comment.errors.full_messages.join(", ")  
            render :new
        end
    end

    def edit 
      @comment = Comment.find_by(:id => params[:id])
      flash[:message] = @comment.errors.full_messages.join(", ")  
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
          redirect_to comment_path(@comment)
        else
          render :edit
        end
    end
      
    def destroy
        comment = Comment.find(params[:id])
        comment.delete
        redirect_to '/'
    end
    
      private
    
      def comment_params
        params.require(:comment).permit(:comment_text, :comment_date, :job_id)
      end
    
end
