class UserListsController < ApplicationController
  def index
    @user_lists = UserList.all
  end

  def show
    @user_list = UserList.find(params[:id])
  end

  def new
    @user_list = UserList.new
  end

  def create
    @user_list = UserList.new
    @user_list.user_id = params[:user_id]
    @user_list.list_id = params[:list_id]

    if @user_list.save
      redirect_to "/user_lists", :notice => "User list created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user_list = UserList.find(params[:id])
  end

  def update
    @user_list = UserList.find(params[:id])

    @user_list.user_id = params[:user_id]
    @user_list.list_id = params[:list_id]

    if @user_list.save
      redirect_to "/user_lists", :notice => "User list updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user_list = UserList.find(params[:id])

    @user_list.destroy

    redirect_to "/user_lists", :notice => "User list deleted."
  end
end
