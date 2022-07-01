class DinosController < ApplicationController

    def index
        # gather all of the relevant information from the database  
        dinos = Dino.all
        # send the info over as the specified datatype -> json
        render json: dinos
    end
  
    def create
        dino = Dino.create(dino_params)
        render json: dino
    end
    
    def update
        dino = Dino.find(params[:id])
        dino.update(dino_params)
        render json: dino
    end
    
    def destroy
        dino = Dino.find(params[:id])
        dino.destroy
        render json: dino 
    end
      
    private
    
        def dino_params
          params.require(:dino).permit(:name, :age, :enjoys, :image)
        end
    
end
