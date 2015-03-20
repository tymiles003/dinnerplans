class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :steps

  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
end
