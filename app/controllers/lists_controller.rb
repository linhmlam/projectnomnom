class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
  end

  def new
    @list = List.new
    @recipes = Recipe.all
  end

  def create
    @list = List.new
    @list.name = params[:name]
    @list.user_id = params[:user_id]

    if @list.save
      redirect_to "/items/new?list_id=#{@list.id}", :notice => "List created successfully."
    else
      render 'new'
    end
  end

  def edit
    @list = List.find(params[:id])
    @items = Item.where(:list_id => @list.id)
  end

  def update
    @list = List.find(params[:id])

    @list.name = params[:name]
    @list.user_id = params[:user_id]

    if @list.save
      redirect_to "/lists/#{@list.id}/edit", :notice => "List updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])

    @items = Item.where(:list_id => @list.id)
    @items.each do |item|
      item.destroy
    end

    @list.destroy

    redirect_to "/lists", :notice => "List deleted."
  end
end
