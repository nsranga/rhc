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
	   retina_params = params.require(:retina).permit(:hba1c)
       @retina = Retina.new(retina_params)

       if @retina.save
         redirect_to @retina
       else
         render :new
       end
    end 
end
