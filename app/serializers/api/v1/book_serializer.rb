class Api::V1::BookSerializer < ActiveModel::Serializer
    attributes :title, :author, :genre, :category, :status, :photo

    def title
        object.title
    end

    def author
        object.author.full_name
    end

    def genre
        object.genre.keyword
    end

    def category
        object.category
    end

    def photo
        object.photo
    end

    def status
        object.status
    end
end