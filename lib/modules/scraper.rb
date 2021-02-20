module BestsellerScraper
    require 'open-uri'
    require 'down'
    require 'fileutils'
    require 'dotenv/tasks'

    def self.mock_download
        puts "downloading books bleep bloop"
    end 

    # https://cloudinary.com/documentation/fetch_remote_images
    # `https://res.cloudinary.com/dtb2b6cpx/image/fetch/${item.dataset.image}`
    # need to loop through 

    def self.daily_download        
        Bestseller.destroy_all
        Cloudinary::Api.delete_resources_by_prefix('bestsellers')
        FileUtils.rm_rf(Dir['lib/modules/bestseller_images/*'])
        html = URI.open('https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8')
        doc = Nokogiri::HTML(html)
        bestseller_rows_array = doc.css('.topX-row')
        bestseller_rows_array.each do |row|
            book_title = row.css('.product-info-title a').text
            book_author = row.css('.product-shelf-author a').text
            book_img_path = row.css('.pTopXImageLink img')[0].attr('src')
            book_img_url = "https:#{book_img_path}"
            
            # image download and upload to CDN logic
            tempfile = Down.download(book_img_url, max_size: 5 * 1024 * 1024)
            disk_path = "lib/modules/bestseller_images/#{book_title.parameterize}-cover.jpg"
            FileUtils.mv(tempfile.path, disk_path)
            response = Cloudinary::Uploader.upload(disk_path, use_filename: true, folder: 'bestsellers')
            cloudinary_img_url = response["url"]

            # TODO maybe add rating
            # TODO maybe add publish date
            BestsellerScraper.generate_bestseller(book_title, book_author, cloudinary_img_url)
        end
    end 

    def self.generate_bestseller(book_title, book_author, cloudinary_img_url)
        Bestseller.create(title: book_title, author: book_author,  photo: cloudinary_img_url)
    end
end