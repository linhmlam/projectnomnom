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
      redirect_to "/recipes", :notice => "Recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.photo = params[:photo]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe updated successfully."
    else
      render 'edit'
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
