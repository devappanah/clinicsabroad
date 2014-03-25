class Photo < ActiveRecord::Base
  belongs_to :shop

  mount_uploader :name, ImageUploader
end
