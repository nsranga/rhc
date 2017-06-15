class RetinasController < ApplicationController
	def index
	   @retinas = ['image1', 'image2', 'image3']
	end
	def new 
	   @retina = Retina.new()
	end  
	def show
		@retina = Retina.find(params[:id])
	end 
	def create
	   retina_params = params.require(:retina).permit(:hba1c, 
	   	                                              :lipid_profile,  
	   	                                              :kidney_renal, 
	   	                                              :kidney_creatinine, 
	   	                                              :kidney_micro_album, 
	   	                                              :smoking, 
	   	                                              :smoking_related_lung_disease, 
	   	                                              :diabetic_duration, 
	   	                                              :cad_stroke, 
	   	                                              :good_follow_up)
       @retina = Retina.create(retina_params)

       if @retina.save!
         redirect_to @retina
       else
         render :new
       end
    end 
end
