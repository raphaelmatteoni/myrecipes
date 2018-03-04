class RecipeShare < ApplicationRecord
	# Associations
  belongs_to :recipe
  belongs_to :user

	# Validations

	validates :user_id, presence: true
	validates :recipe_id, presence: true
	#validates_uniqueness_of :user_id, scope: :recipe_id

	# Class methods

	# Hooks

	#before_action

	# Instance methods  
end
