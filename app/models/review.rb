class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :rating, presence: true, :numericality => {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :content_body, presence: true, length: {
    minimum: 50,
    maximum: 250,
    too_short: "This review must have at least 50 characters",
    too_long: "This review must have no more than 250 characters"
  }
end

# numericality: { greater_than_or_equal_to: 1
#
# }
