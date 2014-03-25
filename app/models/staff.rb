class Staff < ActiveRecord::Base
  belongs_to :shop

  mount_uploader :avatar, ImageUploader
end
