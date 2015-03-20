class Pantry < ActiveRecord::Base
	has_many :ingredients, as: :ingredients_list
	belongs_to :user
	validates :user_id, presence: true

	accepts_nested_attributes_for :ingredients, allow_destroy: true

  def ingredients_by_category(category)
    self.ingredients.where(category: category)
	end

	def categories
		current_categories
	end

	def categories_with_ingredients
		current_categories.select { |category| 
			ingredients_by_category(category).count > 0 }
	end

	def ingredient_names
		self.ingredients.collect { |ingredient| ingredient.name}
	end

	def available_ingredients
		self.ingredients.collect { |ingredient|
		  if ingredient.amount != 0
		  	ingredient.name
		  end }
	end

	private

	  def current_categories
	  	%w(Beef Chicken Fish Pork Meat Fruit Dairy 
	  		Grains/Pasta Vegetable Alchohol Seasoning Other)
	  end
end
