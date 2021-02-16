module BestsellerScraper
    require 'open-uri'

    def self.mock_download
        puts "downloading books bleep bloop"
    end 

    def self.daily_download
        Bestseller.destroy_all
        html = URI.open('https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8')
        doc = Nokogiri::HTML(html)
        bestseller_rows_array = doc.css('.topX-row')
        bestseller_rows_array.each do |row|
            book_title = row.css('.product-info-title a').text
            book_author = row.css('.product-shelf-author a').text
            book_img_path = row.css('.pTopXImageLink img')[0].attr('src')
            book_img_url = "https:#{book_img_path}"
            # maybe add rating
            # maybe add publish date
            BestsellerScraper.generate_bestseller(book_title, book_author, book_img_url)
        end
    end 

    def self.generate_bestseller(book_title, book_author, book_img_url)
        Bestseller.create(title: book_title, author: book_author,  photo: book_img_url)
    end
end