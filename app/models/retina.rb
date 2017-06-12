class Retina < ApplicationRecord
	validates :hba1c, presence: true
	validates_inclusion_of :hba1c, :in => 1..10

	def calculate_score()
      return 4
	end 
end
