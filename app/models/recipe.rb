class Recipe < ApplicationRecord
	# Associations

  belongs_to 	:user
  has_many 		:ingredients, :dependent => :delete_all
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  has_attached_file :photo, styles: { medium: "200x200>", thumbnail: "150x150>" }, default_url: ":style/missing.png"

	# Validations

	validates :title, presence: true
	validates :description, presence: true
	validates :how_to_prepare, presence: true
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# Class methods

	scope :by_title, -> title { where("title LIKE '%#{title}%'") }

	# Hooks

	#before_action

	# Instance methods  

end
