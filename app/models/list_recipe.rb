class ListRecipe < ActiveRecord::Base
  validates :list_id, :presence => true
  validates :recipe_id, :presence => true

end
