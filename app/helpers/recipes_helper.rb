module RecipesHelper
	def makeable_recipes
		@user.recipes.select { |recipe| makeable?(recipe)}
	end

	def makeable?(recipe)
		recipe.items.all? { |item| 
			@pantry.available_ingredients.include?(Ingredient.find(item.ingredients_id).name) }
	end

end