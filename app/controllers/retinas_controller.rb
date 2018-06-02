class RetinasController < ApplicationController
	def index
	   @retinas = ['image1', 'image2', 'image3']
	end
	def new 
	   @retina = Retina.new()
     @retina.kidney_renal=200;
     @retina.hba1c=7;
	end  
	def show
		@retina = Retina.find(params[:id])
	end 
	def edit
        @retina = Retina.find(params[:id])

        #redirect_to retina_steps_path(@retina.id) 
	end 

	def update
        @retina = Retina.find(params[:id])
        permit_params
        @retina.update(permit_params)

        # update session values
        session[:hba1c] = params[:retina][:hba1c]
        @retina.hba1c = session[:hba1c]

        render :show

        #redirect_to retina_steps_path(@retina.id) 
	end 

private  def permit_params
    retina_params = params.require(:retina).permit( :hba1c,
                                                    :lipid_profile,
                                                    :kidney_renal,
                                                    :kidney_micro_album,
                                                    :smoking,
                                                    :smoking_related_lung_disease,
                                                    :diabetic_duration,
                                                    :cad_stroke,
                                                    :good_follow_up)

  end

	def create

       retina_params = params.require(:retina).permit(:retina_base_score)
       @retina = Retina.create(retina_params)
       #defaults
       @retina.lipid_profile=200;
       @retina.hba1c=7;
       if @retina.save!
       	 session[:retina_id] = @retina.id


      
         # store value in session to be used later for construcing URL
         session[:retina_base_score] = params[:retina][:retina_base_score]
       	 #default value of the field on back buttom press on serum page
     
         redirect_to retina_steps_path(@retina.id) 
         puts "retina id in session is: #{session[:retina_id]}"
         puts "retina BASE SCORE in session is: #{session[:retina_base_score]}"
         #redirect_to new_retina_path 
       else
         render :new
       end
    end 
end
