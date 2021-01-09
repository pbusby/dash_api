module Api
    module V1
        class BooksController < ApplicationController
            def create_book_record
                @author = Author.where(full_name: book_params[:full_name]).first_or_create({full_name: book_params[:full_name]}) 
                @genre = Genre.where(keyword: book_params[:keyword]).first_or_create(book_params[:keyword])
                book_attributes = {title: book_params[:title], author_id: @author.id, genre_id: @genre.id, user_id: 1, photo: book_params[:cover_url], status: book_params[:status]} 
                @book = Book.where(title: book_params[:title], user_id: 1).first_or_initialize(book_attributes)
                
                if @book.save
                    render json: @book, status: :ok
                else 
                    render json: @book.errors, status: :unprocessable_entity
                end 
            end

            def index
                @books = Book.all
                render json: @books, status: :ok
            end

            def read_books
                # byebug
                @books = Book.already_read
                render json: @books, status: :ok
            end

            def read_next_books
                # byebug
                @books = Book.read_next
                render json: @books, status: :ok
            end

            def destroy
                @book = Book.find(params[:id])
                if @book.destroy 
                    render json: @book, status: :ok
                else
                    render json: @book.errors, status: :unprocessable_entity
                end
            end

            private

            def book_params
                params.permit(:id, :title, :full_name, :cover_url, :keyword, :status)
            end
        end
    end
end