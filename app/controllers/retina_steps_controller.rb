class RetinaStepsController < ApplicationController
  include Wicked::Wizard
  steps :serum_cholesterol, :kidney_renal
  
  def show
  	@current_retina_id = current_retina_id
  	@retina = Retina.find(@current_retina_id)
  	puts "current retina id is: #{@current_retina_id}"
    render_wizard 
  end


  def update
  	@current_retina_id = current_retina_id
  	@retina = Retina.find(@current_retina_id)
  	retina_params = params.require(:retina).permit(:lipid_profile)
  	@retina.attributes = retina_params
    render_wizard @retina
  end
end

