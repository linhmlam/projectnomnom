class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
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

    else
        @item.save
    end

    redirect_to "/lists", :notice => "Item updated successfully."
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.list_id = params[:list_id]
    @item.item = params[:item]
    @item.quantity = params[:quantity]
    @item.unit = params[:unit]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/lists", :notice => "Item deleted."
  end
end
