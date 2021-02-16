module Api
    module V1
        class BestsellersController < ApplicationController
            def index
                @books = Bestseller.all
                render json: @books, status: :ok
            end
        end
    end
end
