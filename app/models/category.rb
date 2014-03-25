class Category < ActiveRecord::Base
  has_many :services
  has_and_belongs_to_many :shops
end
