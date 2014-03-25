class User < ActiveRecord::Base

  has_many :shops
  has_many :messages
  has_many :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    read_attribute(:name) || read_attribute(:email)
  end
end
