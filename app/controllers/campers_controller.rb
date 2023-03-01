class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_error
rescue_from ActiveRecord::RecordInvalid, with: :invalid_error

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: 200
    end

    def create 
        camper = Camper.create!(camper_param)
        render json: camper, status: :created
    end

    private 

    def camper_param
        params.permit(:name, :age)
    end

    def camper_error
        render json: {error: "Camper not found"}, status: :not_found
    end

    def invalid_error(error)
        render json: {error: error.message}, status: 422
    end
end
