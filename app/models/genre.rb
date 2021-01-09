class Genre < ApplicationRecord
    has_many :books
  
    include PgSearch
    pg_search_scope :search_by_genre,
      against: :keyword,
      using: {
        tsearch: { prefix: true }
      }

end
