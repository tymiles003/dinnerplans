class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :recipe, index: true
      t.float :amount
      t.integer :ingredients_id

      t.timestamps null: false
    end
    add_foreign_key :items, :recipes
  end
end
