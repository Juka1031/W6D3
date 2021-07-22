class UsersController < ApplicationController

    def index
        @test = User.select(:title).joins(:artwork)
        # .where("params[:id] = artworks.artist_id OR params[:id] = artwork_shares.viewer_id")
        @users = User.all
        render json: @test
    end

    def create
        @user = User.new(user_params) # name: params[:name], email: params[:email]
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end
    
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end
    
    private

    def user_params
        params.require(:user).permit(:username)
    end
end