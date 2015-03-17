class Pantry < ActiveRecord::Base
	has_many :ingredients, as: :ingredients_list
	belongs_to :user
	validates :user_id, presence: true

	accepts_nested_attributes_for :ingredients, allow_destroy: true

	def ingredients_by_category(category)
		self.ingredients.where(category: category)
	end
end
