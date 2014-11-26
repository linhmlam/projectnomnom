class ListRecipesController < ApplicationController
  def index
    @list_recipes = ListRecipe.all
  end

  def show
    @list_recipe = ListRecipe.find(params[:id])
  end

  def new
    @list_recipe = ListRecipe.new
  end

  def create
    @list_recipe = ListRecipe.new
    @list_recipe.list_id = params[:list_id]
    @list_recipe.recipe_id = params[:recipe_id]

    if @list_recipe.save
      redirect_to "/list_recipes", :notice => "List recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @list_recipe = ListRecipe.find(params[:id])
  end

  def update
    @list_recipe = ListRecipe.find(params[:id])

    @list_recipe.list_id = params[:list_id]
    @list_recipe.recipe_id = params[:recipe_id]

    if @list_recipe.save
      redirect_to "/list_recipes", :notice => "List recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @list_recipe = ListRecipe.find(params[:id])

    @list_recipe.destroy

    redirect_to "/list_recipes", :notice => "List recipe deleted."
  end
end
