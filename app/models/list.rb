class List < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  has_many :recipe_ingredients, :through => :recipes

  validates :name, :presence => true
  validates :user_id, :presence => true
end
