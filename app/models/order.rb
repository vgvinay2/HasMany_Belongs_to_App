class Order < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :customer # , :class_name=>"Customer",:foreign_key => "customer_id"
 end
