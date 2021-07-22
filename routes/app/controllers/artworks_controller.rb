class ArtworksController < ApplicationController

    def index
        #param[id]

        if User.exists?(params[:user_id]) #if the user exists
            # @artwork = Artwork.where(artist_id: params[:user_id]) #where = artist_id, params[:id] = artwork.id
            @artwork = Artwork.left_outer_joins(:artwork_shares).where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', params[:user_id] , params[:user_id])
        else #if the user does not exist, display all artworks?

            @artwork = Artwork.all
        end
        # @test = User.find(params[:id])
        # @artworks = Artwork.all
        render json: @artwork
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