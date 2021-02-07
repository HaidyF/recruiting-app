class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create 
        @comment = Comment.new(comment_params)

        if @comment.valid?
          @comment.save
          redirect_to comment_path(@comment)
        else
            render :new
        end
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
        Comment.find(params[:id]).delete
        redirect_to comment_path
    end
    
      private
    
      def comment_params
        params.require(:comment).permit(:comment_text, :comment_date)
      end
    
end
