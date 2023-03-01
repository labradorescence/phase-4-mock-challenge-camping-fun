class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_signup
    def create
        signup = Signup.create!(signup_param)
        render json: signup, serializer: SignupActivitySerializer, status: :created
    end

    private

    def signup_param
        params.permit(:time, :activity_id, :camper_id)
    end

    def invalid_signup
        render json:  {"errors": ["validation errors"]}, status: 422
    end
end
