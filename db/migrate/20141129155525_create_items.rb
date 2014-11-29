class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :item
      t.float :quantity
      t.string :unit

      t.timestamps

    end
  end
end
