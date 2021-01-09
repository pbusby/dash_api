module Api
    module V1
        class GenresController < ApplicationController
            def all_genres
                @genres = Genre.order(:keyword)
                render json: @genres, status: :ok
            end
        end
    end
end