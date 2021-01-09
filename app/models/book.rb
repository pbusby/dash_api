class Book < ApplicationRecord
    belongs_to :user
    belongs_to :author
    belongs_to :genre
    enum status: [:already_read, :read_next]
    scope :already_read, -> { where(status: 0) }
    scope :read_next, -> { where(status: 1) }
end
