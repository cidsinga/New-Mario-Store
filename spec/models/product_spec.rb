require 'rails_helper'

describe Product do
  it { should have_many (:reviews) }
  it { should validate_presence_of :prod_name }
  it { should validate_length_of(:prod_name).is_at_most(100) }
  it("titleizes the name of a product") do
    product = Product.create({prod_name: "giant steps"})
    expect(product.prod_name()).to(eq("Giant Steps"))
  end
end
