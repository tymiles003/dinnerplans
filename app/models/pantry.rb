class Pantry < ActiveRecord::Base
	has_many :ingredients, as: :ingredients_list
	belongs_to :user
end
