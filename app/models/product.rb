class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :prod_name, presence: true
  validates_length_of :prod_name, maximum: 100
  before_save(:titleize_product)

  private
  def titleize_product
    self.prod_name = self.prod_name.titleize
  end
end
