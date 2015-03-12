require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

	def setup
		@ingredient = Ingredient.new(name: "Ground Beef", category: "Beef")
	end
  
  test "should be valid" do
  	assert @ingredient.valid?
  end

  test "name should be present" do
  	@ingredient.name = ""
  	assert_not @ingredient.valid?
  end

  test "category should be present" do
  	@ingredient.category = ""
  	assert_not @ingredient.valid?
  end
end
