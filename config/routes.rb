Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :favorite_links
      post '/create_book_record', to: 'books#create_book_record'
      get '/read_books', to: 'books#read_books'
      get '/read_next_books', to: 'books#read_next_books'
      resources :books, only: [:destroy]
      get '/genres', to: 'genres#all_genres'
    end 
  end
end
