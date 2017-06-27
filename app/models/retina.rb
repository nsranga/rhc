class Retina < ApplicationRecord
	# validates :hba1c, :lipid_profile, :kidney_creatinine, presence: true
	#validates_inclusion_of :hba1c, :in => 1..10

	def current_retina
		Retina.find(session[:retina_id])
	end 

	def calculate_score()
	  @score = 0

	  # calculating creatinine score ahead in time
	  @kidney_creatinine_score
	  if self.kidney_creatinine > 4
	    @kidney_creatinine_score = 3
	  else 
	    @kidney_creatinine_score = 2
      end 

      # the score based on all of the params 
	  @score = (self.hba1c - 7) + 
	           (self.lipid_profile-100)/50 * 0.5 + 
	           (self.kidney_renal) +
	           (self.kidney_micro_album) +
	            @kidney_creatinine_score +
	            self.diabetic_duration +
	            self.smoking +
	            self.smoking_related_lung_disease +
	            self.cad_stroke +
	            self.good_follow_up
      return @score
	end 

	def list_years_based_on_score 
      @score = calculate_score 
      n = 1

      while (calculate_score  * n) <=100 
      	n = n + 1 
      	#list [] << calculate_score  * n
      end 
      return list
	end 
end
