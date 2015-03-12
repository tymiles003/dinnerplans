class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :category
      t.float :amount
      t.references :ingredients_list, polymorphic: true
      t.timestamps null: false
    end
  end
end
