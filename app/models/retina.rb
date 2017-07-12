class Retina < ApplicationRecord
	# validates :hba1c, :lipid_profile, :kidney_creatinine, presence: true
	#validates_inclusion_of :hba1c, :in => 1..10
    attr_accessor :no_of_years
    attr_accessor :retina_base_score 

    def calculate_hba1c_score()

      @hba1c_score = 0
  
   	  if self.hba1c >= 5 or self.hba1c < 6  
    	@hba1c_score = 0
      elsif self.hba1c >= 6 or self.hba1c < 7 
          @hba1c_score = 1
      elsif self.hba1c >= 7 or self.hba1c < 8
          @hba1c_score = 2      
      elsif self.hba1c >= 8 or self.hba1c < 9 
          @hba1c_score = 3
      elsif self.hba1c >= 9 or self.hba1c < 10
          @hba1c_score = 4
      elsif self.hba1c >= 10 or self.hba1c < 11
          @hba1c_score = 5
      elsif self.hba1c >= 11 
          @hba1c_score = 6
      end
    end 

    def calculate_lipid_score()

      @lipid_score = 0
  
   	  if self.lipid_profile < 100  
    	@lipid_score = 0
      elsif self.lipid_profile >= 100 and self.lipid_profile < 150
          @lipid_score = 0.5
      elsif self.lipid_profile >= 150 and self.lipid_profile < 200
      	  @lipid_score = 1	 
      elsif self.lipid_profile >= 200 and self.lipid_profile < 250
      	  @lipid_score = 1.5
      elsif self.lipid_profile >= 250 and self.lipid_profile < 300
      	  @lipid_score = 2 
      elsif self.lipid_profile >= 300 
      	  @lipid_score = 2.5
      end 

    end 


	def calculate_score()
	  @score = 0

      # the score based on all of the params 
	  @score = self.calculate_hba1c_score + 
	           self.calculate_lipid_score + 
	           self.kidney_renal +
	           (self.diabetic_duration)/2 + # /2 --> to use integer database column, value is stored 2 X multiplied
	           self.smoking +
	           self.smoking_related_lung_disease +
	           self.cad_stroke +
	           self.good_follow_up
      return @score
	end 

	# deprecated - to be deleted later as part of refactoring

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
