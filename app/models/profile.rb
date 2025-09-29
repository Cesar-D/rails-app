class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthh, presence: true
  validates :gender, presence: true

  belongs_to :user
end
