class MadeMeal < ActiveRecord::Base
  belongs_to :user

  def name
    Recipe.find(self.recipe_id).name
  end
end
