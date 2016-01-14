class Customer < ActiveRecord::Base

  validates :name, :city, :address, presence: true
  has_many :orders , :dependent => :destroy
  scope :search, ->(keyword){ where('name LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

end
