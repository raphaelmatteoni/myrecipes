class Ingredient < ApplicationRecord
	# Associations
  belongs_to :recipe

 	# Validations

	validates :name, presence: true
	validates :amount, presence: true

	# Class methods

	#scope

	# Hooks

	#before_action

	# Instance methods
end
