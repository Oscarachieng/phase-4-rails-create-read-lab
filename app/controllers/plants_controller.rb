class PlantsController < ApplicationController

    def index 
        @plants = Plant.all 
        if @plants
          render json: @plants, except: [:created_at, :updated_at]
        else
          render json: {error: "resource not found"}, status: :not_found
        end
    end

    #show route Action
    def show 
      @plant = Plant.find_by(id:params[:id]) 
      if @plant
        render json: @plant, except: [:created_at, :updated_at]
      else
        render json: {error: "resource not found"}, status: :not_found
      end
    end

    #Create Action
    def create 
        @new_plant = Plant.create(plant_params)
        render json: @new_plant, status: :created
    end

    private
    def plant_params 
        params.permit(:name, :image, :price)
    end


end
