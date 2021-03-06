module Api
    module V1
        class BooksController < ApplicationController
            def create_book_record
                @author = Author.where(full_name: book_params[:full_name]).first_or_create({full_name: book_params[:full_name]}) 
                @genre = Genre.where(keyword: book_params[:keyword]).first_or_create(book_params[:keyword])
                book_attributes = {title: book_params[:title], author_id: @author.id, genre_id: @genre.id, user_id: User.all.first.id, photo: book_params[:cover_url], status: book_params[:status], score: book_params[:score]} 
                @book = Book.where(title: book_params[:title], user_id: User.all.first.id).first_or_initialize(book_attributes)
                
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
                @books = Book.already_read.page(params[:page]).per(10)
                pagination_meta = {
                    total: @books.count,
                    per_page: 10,
                    current_page: params[:page],
                    last_page: @books.total_pages,
                    next_page_url: 'https://www.google.com',
                    prev_page_url: 'https://www.google.com',
                    from: 'wtf is this',
                    to: 'wtf is this'
                }
                data = {
                    pagination: pagination_meta, 
                    books: ActiveModel::Serializer::CollectionSerializer.new(
                    @books,
                    root: 'books',
                    serializer: Api::V1::BookSerializer).as_json
                    }

                render json: data, root: "books", status: :ok
            end

            def read_next_books
                @books = Book.read_next
                data = {
                    books: ActiveModel::Serializer::CollectionSerializer.new(
                    @books,
                    root: 'books',
                    serializer: Api::V1::BookSerializer).as_json
                }
                render json: data, root:"books", status: :ok
            end

            def bestsellers 
                @books = Bestseller.all.page(params[:page]).per(10)
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
                params.permit(:id, :title, :full_name, :cover_url, :keyword, :status, :score, :page)
            end
        end
    end
end