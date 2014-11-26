# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


recipe_ingredient_new_info = [
  {
    :recipe_id => "4",
    :quantity => "8",
    :unit => "ounces",
    :ingredient => "cheese rinds"
    },
  {
    :recipe_id => "4",
    :quantity => "6",
    :unit => "cups",
    :ingredient => "water"
    },
  {
    :recipe_id => "4",
    :quantity => "1",
    :unit => "large",
    :ingredient => "onion"
    },
  {
    :recipe_id => "4",
    :quantity => "3",
    :unit => "cloves",
    :ingredient => "garlic"
    },
  {
    :recipe_id => "4",
    :quantity => "0.5",
    :unit => "teaspoon",
    :ingredient => "peppercorns"
    },
  {
    :recipe_id => "4",
    :quantity => "1",
    :unit => "handful",
    :ingredient => "flat-leaf parsley"
    },
  {
    :recipe_id => "4",
    :quantity => "3",
    :unit => "ounces",
    :ingredient => "kale"
    },
  {
    :recipe_id => "4",
    :quantity => "1.25",
    :unit => "cups",
    :ingredient => "white beans"
    },
  {
    :recipe_id => "4",
    :quantity => "1",
    :unit => "",
    :ingredient => "baguette"
    },
  {
    :recipe_id => "4",
    :quantity => "1",
    :unit => "box",
    :ingredient => "parmesan"
    },
  {
    :recipe_id => "5",
    :quantity => "0.5",
    :unit => "cup",
    :ingredient => "walnut halves"
    },
  {
    :recipe_id => "5",
    :quantity => "0.25",
    :unit => "cup",
    :ingredient => "golden raisins"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "tablespoon",
    :ingredient => "white wine vinegar"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "tablespoon",
    :ingredient => "water"
    },
  {
    :recipe_id => "5",
    :quantity => "0.25",
    :unit => "cup",
    :ingredient => "panko"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "clove",
    :ingredient => "garlic"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "pinch",
    :ingredient => "salt"
    },
  {
    :recipe_id => "5",
    :quantity => "3",
    :unit => "tablespoons",
    :ingredient => "olive oil"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "bunch",
    :ingredient => "kale"
    },
  {
    :recipe_id => "5",
    :quantity => "2",
    :unit => "ounces",
    :ingredient => "pecorino cheese"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "",
    :ingredient => "lemon"
    },
  {
    :recipe_id => "5",
    :quantity => "1",
    :unit => "pinch",
    :ingredient => "black pepper"
    },
]

recipe_ingredient_new_info.each do |hash|
  r = RecipeIngredient.new
  r.recipe_id = hash[:recipe_id]
  r.quantity = hash[:quantity]
  r.unit = hash[:unit]
  r.ingredient = hash[:ingredient]
  r.save
end
