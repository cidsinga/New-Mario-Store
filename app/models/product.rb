class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  scope :usa, -> { where(country_of_origin: "US")}
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.prod_name, count(reviews.id) as most_reviews ")
    .joins(:reviews)
    .group("products.id")
    order("most_reviews DESC")
    .limit(5)
    )}


    validates :prod_name, presence: true
    validates_length_of :prod_name, maximum: 100
    validates :cost, presence: true
    validates :country_of_origin, presence: true
    before_save(:titleize_product)


    private
    def titleize_product
      self.prod_name = self.prod_name.titleize
    end
  end
