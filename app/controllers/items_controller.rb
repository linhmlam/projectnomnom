class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.list_id = params[:list_id]
  end

  def create
    @item = Item.new
    @item.list_id = params[:list_id]
    @item.name = params[:item]
    @item.quantity = params[:quantity]
    @item.unit = params[:unit]

    if @item==Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item = Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item.quantity = old_item.quantity + @item.quantity
        old_item.save

        redirect_to :back, :notice => "#{@item.name.capitalize} added successfully."
    else
        if @item.save

        redirect_to "/items/new?list_id=#{@item.list_id}", :notice => "#{@item.name.capitalize} added successfully."

        else
          @list = @item.list
          @items = Item.where(:list_id => @list.id)
          render '/lists/edit'
        end
    end
  end

  def create_item_from_list_edit
    @item = Item.new
    @item.list_id = params[:list_id]
    @item.name = params[:item]
    @item.quantity = params[:quantity]
    @item.unit = params[:unit]

    if @item==Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item = Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item.quantity = old_item.quantity + @item.quantity
        old_item.save

        redirect_to "/lists/#{@item.list_id}/edit", :notice => "#{@item.name.capitalize} added successfully."
    else
        if @item.save

        redirect_to :back, :notice => "#{@item.name.capitalize} added successfully."

        else
          @list = @item.list
          @items = Item.where(:list_id => @list.id)
          render '/lists/edit'
        end
    end
  end

  def new_from_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @lists = List.where(:user_id => current_user)
    @item = Item.new
  end

  def create_from_recipe
    @list = List.find(params[:list_id])
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = RecipeIngredient.where(:recipe_id => @recipe.id)
    @ingredients.each do |ingredient|
      @item = Item.new
      @item.list_id = @list.id
      @item.name = ingredient.ingredient
      @item.quantity = ingredient.quantity
      @item.unit = ingredient.unit

      if @item==Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item = Item.find_by(:list_id => @item.list_id, :name => @item.name)
        old_item.quantity = old_item.quantity + @item.quantity
        old_item.save
      else
        @item.save
      end
    end

    redirect_to "/lists/#{@item.list_id}", :notice => "Recipe added successfully."
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.list_id = params[:list_id]
    @item.name = params[:item]
    @item.quantity = params[:quantity]
    @item.unit = params[:unit]

    if @item.save
      redirect_to "/lists/#{@item.list_id}/edit", :notice => "Item updated successfully."
    else
      redirect_to "/lists/#{@item.list_id}/edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/lists/#{@item.list_id}/edit", :notice => "Item deleted."
  end
end
