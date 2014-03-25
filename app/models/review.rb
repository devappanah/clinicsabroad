class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  validates :score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
