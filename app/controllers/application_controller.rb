class ApplicationController < ActionController::API
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordNotFound, with: :not_founded
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid


    private 

    def not_valid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def not_founded(unfounded)
        render json: {error:  "#{unfounded.model} not found"}, status: :not_found
    end 

end
