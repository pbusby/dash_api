# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Genre.destroy_all
Book.destroy_all
User.destroy_all

author_1 = Author.create(full_name: "J.R.R. Tolkein")
author_2 = Author.create(full_name: "William Golding")
author_3 = Author.create(full_name: "J.D. Salinger")
author_4 = Author.create(full_name: "Ernest Hemmingway")
author_5 = Author.create(full_name: "J.K. Rowling")

# non fiction

genre_1 = Genre.create(keyword: "Art")
genre_2 = Genre.create(keyword: "Biography")
genre_3 = Genre.create(keyword: "Business")
genre_4 = Genre.create(keyword: "Food & Beverage")
genre_5 = Genre.create(keyword: "Crafts & Hobbies")
genre_6 = Genre.create(keyword: "Politics")
genre_7 = Genre.create(keyword: "History")
genre_8 = Genre.create(keyword: "Music, Film and Performing Arts")
genre_9 = Genre.create(keyword: "Nature")
genre_10 = Genre.create(keyword: "Technology")
genre_11 = Genre.create(keyword: "Travel")
genre_12 = Genre.create(keyword: "Self-Help")
genre_13 = Genre.create(keyword: "Spirituality")
genre_14 = Genre.create(keyword: "Psychology")
genre_15 = Genre.create(keyword: "Philosophy")
genre_16 = Genre.create(keyword: "Parenting & Family")
genre_17 = Genre.create(keyword: "Diet, Health & Fitness")
genre_18 = Genre.create(keyword: "Science")

# fiction
genre_19 = Genre.create(keyword: "Graphic Novels")
genre_20 = Genre.create(keyword: "Literature")
genre_21 = Genre.create(keyword: "Manga")
genre_22 = Genre.create(keyword: "Horror")
genre_23 = Genre.create(keyword: "Historical Fiction")
genre_24 = Genre.create(keyword: "Science Fiction")
genre_25 = Genre.create(keyword: "Fantasy")
genre_26 = Genre.create(keyword: "Thrillers")
genre_27 = Genre.create(keyword: "Mystery & Crime")




user_1 = User.create(email: "paul.busby@gmail.com")

book_1 = Book.create(title: "The Hobbit", author_id: author_1.id, user_id: 1, genre_id: genre_1.id, status: 0 )
book_2 = Book.create(title: "Lord of the Flies", author_id: author_2.id, user_id: 1, genre_id: genre_2.id, status: 0 )
book_3 = Book.create(title: "Catcher in the Rye", author_id: author_3.id, user_id: 1, genre_id: genre_2.id, status: 0 )
book_4 = Book.create(title: "The Sun Also Rises", author_id: author_4.id, user_id: 1, genre_id: genre_2.id, status: 0 )
book_5 = Book.create(title: "Harry Potter and the Sorcerer's Stone", author_id: author_5.id, user_id: 1, genre_id: genre_1.id, status: 0 )