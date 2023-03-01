class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_signup

    def index
        render json: Signup.all, status: :ok
    end

    def create
        signup = Signup.create!(signup_param)
        render json: signup, serializer: SignupActivitySerializer, status: :ok
    end

    private 

    def signup_param
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid_signup(error)
        render json: { error: error.message }
    end

end