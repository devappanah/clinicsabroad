class Service < ActiveRecord::Base
  belongs_to :shop


  def self.distinct_by_name
    pluck(:name).uniq
  end
end