class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe

  validates :recipe_id, :presence => true
  validates :quantity, :presence => true
  validates :ingredient, :presence => true
end
