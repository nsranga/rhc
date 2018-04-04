class RetinaStepsController < ApplicationController
  include Wicked::Wizard
  steps :hba1c, :serum_cholesterol, :kidney_renal, :smoking, :diabetic_duration, :cad_stroke, :good_follow_up, :for_retina_display_yrs
  
  def show
  	@current_retina_id = current_retina_id
  	@retina = Retina.find(@current_retina_id)
  	puts "current retina id is: #{@current_retina_id}"
    render_wizard 
  end

  def finish_wizard_path
    retina_path(@retina)

  end 


  def update
  	@current_retina_id = current_retina_id
  	@retina = Retina.find(@current_retina_id)
  	
  	#puts "all steps are:"
  	#puts wizard_steps
  	#puts "present step is:"
  	#puts step
  	case step 

      when :serum_cholesterol
    	retina_params = params.require(:retina).permit(:lipid_profile)

      when :kidney_renal
    	retina_params = params.require(:retina).permit(:kidney_renal, :kidney_micro_album, :kidney_creatinine)

      when :smoking
    	retina_params = params.require(:retina).permit(:smoking, 
    		                                           :smoking_related_lung_disease)

      when :diabetic_duration
    	retina_params = params.require(:retina).permit(:diabetic_duration)

      when :cad_stroke
    	retina_params = params.require(:retina).permit(:cad_stroke)

      when :good_follow_up
    	retina_params = params.require(:retina).permit(:good_follow_up)

      when :for_retina_display_yrs
      retina_params = params.require(:retina).permit(:no_of_years)

      # store value in session to be used later for construcing URL
      session[:no_of_years] = params[:retina][:no_of_years]

      else 

      #retina_params = params.require(:retina).permit(:retina_base_score)
      
      # store value in session to be used later for construcing URL
      #session[:retina_base_score] = params[:retina][:retina_base_score]

      retina_params = params.require(:retina).permit(:hba1c)
      session[:hba1c] = params[:retina][:hba1c]
      
  	end 

  	@retina.attributes = retina_params

    render_wizard @retina
  end
end

