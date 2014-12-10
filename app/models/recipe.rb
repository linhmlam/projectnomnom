class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, :dependent => :destroy

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => lambda { |a| a[:ingredient].blank? }, allow_destroy: true

  has_many :list_recipes
  has_many :lists, :through => :list_recipes

  validates :name, :presence => true
end
