class ArtworksController < ApplicationController

    def index
        #param[id]
        @test = User.find(params[:id])
        @artworks = Artwork.all
        render json: @test
    end

    def create
        @artwork = Artwork.new(title: params[:title], image_url: params[:image_url], artist_id: params[:artist_id]) # name: params[:name], email: params[:email]
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end
    
    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(title: params[:title], image_url: params[:image_url], artist_id: params[:artist_id])
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end
    
    private

    def artwork_params
        params.require(:artwork).permit(:title)
    end
end