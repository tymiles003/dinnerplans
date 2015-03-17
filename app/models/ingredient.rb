class Ingredient < ActiveRecord::Base
	validates :name, presence: true
	validates :category, presence: true


	belongs_to :ingredients_list, polymorphic: true
end
