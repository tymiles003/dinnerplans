class CreateMadeMeals < ActiveRecord::Migration
  def change
    create_table :made_meals do |t|
      t.references :user, index: true
      t.date :date_made
      t.integer :recipe_id

      t.timestamps null: false
    end
    add_foreign_key :made_meals, :users
  end
end
