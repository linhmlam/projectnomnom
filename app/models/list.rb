class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_recipes
  has_many :recipes, :through => :list_recipes
  has_many :recipes
  has_many :recipe_ingredients, :through => :recipes

  validates :name, :presence => true
  validates :user_id, :presence => true
end
