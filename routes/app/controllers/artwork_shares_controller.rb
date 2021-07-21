class ArtworkSharesController < ApplicationController


    def index
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def create
        @share = ArtworkShare.new(artwork_share_params)
        if @share.save
            render json: @share
        else
            render json: @share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @share = ArtworkShare.find(params[:id])
        @share.destroy
        redirect_to artwork_shares_url
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id,:viewer_id)
    end
end