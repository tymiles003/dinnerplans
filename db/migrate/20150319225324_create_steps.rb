class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe, index: true
      t.string :instruction

      t.timestamps null: false
    end
    add_foreign_key :steps, :recipes
  end
end
