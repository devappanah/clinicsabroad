class Photo < ActiveRecord::Base
  belongs_to :shop

  mount_uploader :name, ImageUploader

  def self.main_only
    where(main: true).first
  end
end
