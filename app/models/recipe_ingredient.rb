class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe

  validates :recipe_id, :presence => true
  validates :quantity, :presence => true
  validates :ingredient, :presence => true

  def ==(other_ingredient)
    self.class == other_ingredient.class &&
    ingredient == other_ingredient.ingredient &&
    unit == other_ingredient.unit &&
    recipe_id == other_ingredient.recipe_id
  end
  alias :eql? :==

end
