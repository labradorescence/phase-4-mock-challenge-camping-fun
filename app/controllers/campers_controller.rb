class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :camper_invalid

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end


    private

    def camper_params
        params.permit(:name, :age)
    end

    def camper_not_found
        render json: { "error": "Camper not found"}, status: 404
    end

    def camper_invalid
        render json: { "errors": ["validation errors"]}, status: 422
    end


end
