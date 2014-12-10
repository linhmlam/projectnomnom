Rails.application.routes.draw do
  # Routes for the Item resource:
  # CREATE
  get('/items/new', { :controller => 'items', :action => 'new' })
  get('/create_item', { :controller => 'items', :action => 'create' })
  get('/create_item_from_list_edit', { :controller => 'items', :action => 'create_item_from_list_edit'})
  get('/items/new_from_recipe/:recipe_id', {:controller => 'items', :action => 'new_from_recipe'})
  get('/create_from_recipe', { :controller => 'items', :action => 'create_from_recipe'})

  # READ
  get('/items', { :controller => 'items', :action => 'index' })
  get('/items/:id', { :controller => 'items', :action => 'show' })

  # UPDATE
  get('/items/:id/edit', { :controller => 'items', :action => 'edit' })
  get('/update_item/:id', { :controller => 'items', :action => 'update' })

  # DELETE
  get('/delete_item/:id', { :controller => 'items', :action => 'destroy' })
  #------------------------------

  devise_for :users
  root 'lists#index'

get('/users/new', )

  # Routes for the User_list resource:
  # CREATE
  get('/user_lists/new', { :controller => 'user_lists', :action => 'new' })
  get('/create_user_list', { :controller => 'user_lists', :action => 'create' })

  # READ
  get('/user_lists', { :controller => 'user_lists', :action => 'index' })
  get('/user_lists/:id', { :controller => 'user_lists', :action => 'show' })

  # UPDATE
  get('/user_lists/:id/edit', { :controller => 'user_lists', :action => 'edit' })
  get('/update_user_list/:id', { :controller => 'user_lists', :action => 'update' })

  # DELETE
  get('/delete_user_list/:id', { :controller => 'user_lists', :action => 'destroy' })
  #------------------------------

  # Routes for the List_recipe resource:
  # CREATE
  get('/list_recipes/new', { :controller => 'list_recipes', :action => 'new' })
  get('/create_list_recipe', { :controller => 'list_recipes', :action => 'create' })

  # READ
  get('/list_recipes', { :controller => 'list_recipes', :action => 'index' })
  get('/list_recipes/:id', { :controller => 'list_recipes', :action => 'show' })

  # UPDATE
  get('/list_recipes/:id/edit', { :controller => 'list_recipes', :action => 'edit' })
  get('/update_list_recipe/:id', { :controller => 'list_recipes', :action => 'update' })

  # DELETE
  get('/delete_list_recipe/:id', { :controller => 'list_recipes', :action => 'destroy' })
  #------------------------------

  # Routes for the List resource:
  # CREATE
  get('/lists/new', { :controller => 'lists', :action => 'new' })
  get('/create_list', { :controller => 'lists', :action => 'create' })

  # READ
  get('/lists', { :controller => 'lists', :action => 'index' })
  get('/lists/:id', { :controller => 'lists', :action => 'show' })

  # UPDATE
  get('/lists/:id/edit', { :controller => 'lists', :action => 'edit' })
  get('/update_list/:id', { :controller => 'lists', :action => 'update' })

  # DELETE
  get('/delete_list/:id', { :controller => 'lists', :action => 'destroy' })
  #------------------------------

  # Routes for the Recipe_ingredient resource:
  # CREATE
  get('/recipe_ingredients/new', { :controller => 'recipe_ingredients', :action => 'new' })
  get('/create_recipe_ingredient', { :controller => 'recipe_ingredients', :action => 'create' })
  get('/create_recipe_ingredient_from_recipe_edit', {:controller => 'recipe_ingredients', :action => 'create_recipe_ingredient_from_recipe_edit'})

  # READ
  get('/recipe_ingredients', { :controller => 'recipe_ingredients', :action => 'index' })
  get('/recipe_ingredients/:id', { :controller => 'recipe_ingredients', :action => 'show' })

  # UPDATE
  get('/recipe_ingredients/:id/edit', { :controller => 'recipe_ingredients', :action => 'edit' })
  get('/update_recipe_ingredient/:id', { :controller => 'recipe_ingredients', :action => 'update' })

  # DELETE
  get('/delete_recipe_ingredient/:id', { :controller => 'recipe_ingredients', :action => 'destroy' })
  #------------------------------
  # # Routes for the Recipe resource:
  # CREATE
  get('/recipes/new', { :controller => 'recipes', :action => 'new' })
  get('/create_recipe', { :controller => 'recipes', :action => 'create' })

  # # READ
  get('/recipes', { :controller => 'recipes', :action => 'index' })
  get('/recipes/:id', { :controller => 'recipes', :action => 'show' })

  # # UPDATE
  get('/recipes/:id/edit', { :controller => 'recipes', :action => 'edit' })
  get('/update_recipe/:id', { :controller => 'recipes', :action => 'update' })

  # # DELETE
  get('/delete_recipe/:id', { :controller => 'recipes', :action => 'destroy' })

end
