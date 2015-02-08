class Customer < ActiveRecord::Base
  #validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true

  has_many :orders , :dependent => :destroy

  def name

  end

  def test
    "hello123221313"
  end

end
