class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthh, presence: true
  validates :gender, presence: true
  validate :validate_gender

  belongs_to :user

  def private validate_gender
    if self.gender != 'Male' || self.gender != 'Female'
      errors.add(:gender, "was specified incorrectly")
    end

  end
end
