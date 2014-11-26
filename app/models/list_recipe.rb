class ListRecipe < ActiveRecord::Base
  has_many :lists
  has_many :recipes

  validates :list_id, :presence => true
  validates :recipe_id, :presence => true

end
