class Item < ActiveRecord::Base
  belongs_to :recipe

  def name
  	Ingredient.find(self.ingredients_id).name
  end
end
