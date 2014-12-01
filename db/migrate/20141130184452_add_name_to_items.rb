class AddNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    remove_column :items, :item, :string
  end
end
