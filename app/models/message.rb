class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  belongs_to :shop

  attr_accessor :phone

  after_create :collect_name_and_phone, if: -> { phone and user }

  def collect_name_and_phone
    user.phone = phone
    user.save
  end
end
