class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def new
    @recipe_ingredient = RecipeIngredient.new
    @recipe_ingredient.recipe_id = params[:recipe_id]
  end

  def create
    @recipe_ingredient = RecipeIngredient.new
    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.unit = params[:unit]
    @recipe_ingredient.quantity = params[:quantity]
    @recipe_ingredient.ingredient = params[:ingredient]

    if @recipe_ingredient==RecipeIngredient.find_by(:recipe_id => @recipe_ingredient.recipe_id, :ingredient => @recipe_ingredient.ingredient)
        old_item = Item.find_by(:recipe_id => @recipe_ingredient.recipe_id, :ingredient => @recipe_ingredient.ingredient)
        old_item.quantity = old_item.quantity + @item.quantity
        old_item.save

        redirect_to "/recipe_ingredients/new?recipe_id=#{@recipe_ingredient.recipe_id}", :notice => "#{@recipe_ingredient.ingredient} added successfully."
    else
      if
        @recipe_ingredient.save
        redirect_to "/recipe_ingredients/new?recipe_id=#{@recipe_ingredient.recipe_id}", :notice => "#{@recipe_ingredient.ingredient} added successfully."
      else

        @recipe = @recipe_ingredient.recipe_id
        @recipe_ingredients = RecipeIngredient.where(:recipe_id => @recipe)
        render 'recipe_ingredient/new'
      end
    end
  end

  def create_recipe_ingredient_from_recipe_edit
    @recipe_ingredient = RecipeIngredient.new
    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.quantity = params[:quantity]
    @recipe_ingredient.unit = params[:unit]
    @recipe_ingredient.ingredient = params[:ingredient]

    if @recipe_ingredient.save
      redirect_to "/recipes/#{@recipe_ingredient.recipe_id}/edit", :notice => "#{@recipe_ingredient.ingredient} created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:ingredient_id])

    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.quantity = params[:quantity]
    @recipe_ingredient.unit = params[:unit]
    @recipe_ingredient.ingredient = params[:ingredient]

    if @recipe_ingredient.save
      redirect_to "/recipes/#{@recipe_ingredient.recipe_id}/edit", :notice => "#{@recipe_ingredient.ingredient} updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    @recipe_ingredient.destroy

    redirect_to "/recipes/#{@recipe_ingredient.recipe_id}/edit", :notice => "Recipe ingredient deleted."
  end
end
