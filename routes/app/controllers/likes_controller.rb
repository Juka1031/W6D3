class LikesController < ApplicationController

    def index
        @likes = Like.all
        render json: @likes
    end

    def create
        @likes = Like.new(likes_param)
    end

    def destroy
        @likes = Like.find(params[:id])
        @likes.destroy
        redirect_to likes_url
    end
end