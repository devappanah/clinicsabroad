class Shop < ActiveRecord::Base
  has_many :reviews,      dependent: :destroy
  has_many :promotions,   dependent: :destroy
  has_many :certificates, dependent: :destroy
  has_many :staffs,        dependent: :destroy
  has_many :photos,       dependent: :destroy
  has_many :services,     dependent: :destroy
  has_many :locations,    dependent: :destroy
  has_many :users, through: :reviews

  has_many :messages
  has_many :appointments

  validates :name, presence: true
  
  accepts_nested_attributes_for :locations, reject_if: :all_blank
  accepts_nested_attributes_for :services, reject_if: :all_blank
  accepts_nested_attributes_for :staffs, reject_if: :all_blank

  has_and_belongs_to_many :categories
  belongs_to :user

  # allowing the shop to be searched by city name
  def self.by_city(city_name) 
    city_name.present? ? joins(:locations).where(locations: { city: city_name }) : all
  end

  # allowing the shop to be searched by country name
  def self.by_country(country_name)
    country_name.present? ? joins(:locations).where(locations: { country: country_name }) : all
  end

  def self.by_service(service_name)
    service_name.present? ? joins(:services).where(services: { name: service_name }) : all
  end

  def self.by_category(category_id)
    category_id.present? ? joins(:categories).where(categories: { id: category_id }) : all
  end

  def average_score
    if reviews.count > 0
      reviews.sum(:score) / reviews.count
    else 0 end
  end
end
