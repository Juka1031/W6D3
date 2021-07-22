class CommentsController < ApplicationController

    def index
        if params[:artwork_id]
            @comments = Comment.where(artwork_id: params[:artwork_id])
        elsif params[:user_id]
            @comments = Comment.where(user_id: params[:user_id])
        else
            @comments = Comment.all
        end
        render json: @comments
    end



    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id)
    end

end