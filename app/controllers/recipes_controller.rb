class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.photo = params[:photo]

    if @recipe.save
      redirect_to "/recipe_ingredients/new?recipe_id=#{@recipe.id}", :notice => "Recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(:recipe_id => @recipe.id)
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.photo = params[:photo]

    if @recipe.save
      redirect_to "/recipes/#{@recipe.id}/edit", :notice => "Recipe updated successfully."
    else
      redirect_to "/recipes/#{@recipe.id}/edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = Recipe.where(:id => @recipe.id)

    @recipe_ingredients.each do |recipe_ingredient|
      recipe_ingredient.destroy
    end

    @recipe.destroy

    redirect_to "/recipes", :notice => "Recipe deleted."
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name,:photo, recipe_ingredients_attributes: [:recipe_id, :unit, :quantity, :ingredient, :_destroy])
    end


end
