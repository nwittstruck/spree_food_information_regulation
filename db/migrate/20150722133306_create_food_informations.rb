class CreateFoodInformations < ActiveRecord::Migration
  def change
    create_table :spree_food_informations do |t|
      t.string :description
      t.text :ingredients
      t.string :net_contents
      t.string :origin
      t.string :producer_address
      t.string :alcohol_content
      t.text :nutrition_information
      t.text :allergens

      t.references :product

      t.timestamps null: false
    end
  end
end
