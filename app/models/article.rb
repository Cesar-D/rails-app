class Article < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    has_one_attached :avatar
    has_rich_text :body
    has_and_belongs_to_many :categories
    belongs_to :user
end
