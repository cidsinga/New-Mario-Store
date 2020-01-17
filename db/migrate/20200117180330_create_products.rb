class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :prod_name
      t.integer :cost
      t.string :country_of_origin

      t.timestamp()
    end
  end
end
