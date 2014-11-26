class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.float :quantity
      t.string :unit
      t.string :ingredient

      t.timestamps

    end
  end
end
