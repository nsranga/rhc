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
	   # retina_params = params.require(:retina).permit(:hba1c, 
	   	 #                                             :lipid_profile,  
	   	  #                                            :kidney_renal, 
	   	   #                                          :kidney_micro_album, 
	   	    #                                          :smoking, 
	   	     #                                         :smoking_related_lung_disease, 
	   	      #                                        :diabetic_duration, 
	   	       #                                       :cad_stroke, 
	   	        #                                      :good_follow_up)
       retina_params = params.require(:retina).permit(:hba1c)
       @retina = Retina.create(retina_params)

       if @retina.save!
       	 session[:retina_id] = @retina.id
       	 #default value of the field on back buttom press on serum page
       	 session[:hba1c] = params[:retina][:hba1c]
         redirect_to retina_steps_path(@retina.id) 
         #puts "retina id in session is: #{session[:retina_id]}"
         #redirect_to new_retina_path 
       else
         render :new
       end
    end 
end
