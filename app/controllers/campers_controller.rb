class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    #/campers
    def index
        render json: Camper.all, status: :ok
    end

    #/campers/id
    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok
    end

    #/campers/
    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end


    private 

    def camper_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def invalid(error)
        render json: { error: error.message }, status: 422
    end
end
