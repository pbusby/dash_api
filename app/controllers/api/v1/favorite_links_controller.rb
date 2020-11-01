module Api
    module V1
        class FavoriteLinksController < ApplicationController

            def index
                @links = FavoriteLink.all
                render json: @links
            end

            def create
                @link = FavoriteLink.new(link_params)
                if @link.save
                    render json: @link, status: :created 
                else 
                    render json: @link.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @link = FavoriteLink.find(link_params[:id])
                if @link.destroy
                    render json: @link, status: :ok
                else
                    render json: @link.errors, status: :unprocessable_entity
                end 
            end
        
        private

        def link_params
            params.permit(:id, :title, :url)
        end

        end
    end
end
