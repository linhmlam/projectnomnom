class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :list_recipes
  has_many :lists, :through => :list_recipes
end
