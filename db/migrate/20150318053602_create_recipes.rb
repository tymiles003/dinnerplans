class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :recipes, :users
  end
end
