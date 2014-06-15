class Location < ActiveRecord::Base
  belongs_to :shop

  # validates :name, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :url, presence: true

  def self.by_city(city_name)
    where("city = ?", city_name)
  end

  reverse_geocoded_by :lat, :lng do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country
    end
  end
  after_validation :reverse_geocode, if: -> { lat.present? and lng.present? }
  
  def self.distinct_cities
    pluck(:city).compact.uniq
  end

end
