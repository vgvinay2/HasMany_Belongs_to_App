class Order < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :customer # , :class_name=>"Customer",:foreign_key => "customer_id"
  scope :search, ->(keyword){ where('name LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
 end
