class CommentsController < ApplicationController
    
    def index
      if params[:job_id]
        @comments = Job.find(params[:job_id]).comments
      else
        @comments = Comment.all
      end
    end

    def new
      @job = Job.find(params[:job_id])
      @comment = @job.comments.build
    end

    def show
      @comment = Comment.find_by(:id => params[:id])
      @job = Job.find_by(:id => @comment.job_id)
      @user = User.find_by(:id => @comment.user_id)
    end

    def create
        @job = Job.find(params[:job_id])
        @comment = @job.comments.build(comment_params)
        @comment.user = current_user
       
        if @comment.valid?
          @comment.save
          redirect_to comment_path(@comment)
        else
            render :new
        end
    end

    def edit 
      @comment = Comment.find_by(:id => params[:id])
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
