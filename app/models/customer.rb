class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  has_many :orders , :dependent => :destroy

end
