class InstructorsController < ApplicationController


    def create 
        instructor = Instructor.create!(instructors_params)
        render json: instructor, status: :created
    end 

    def update
        instructor = Instructor.find(params[:id])
        instructor.update!(instructors_params)
        render json: instructor, status: :ok
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor, status: :ok
    end 

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy 
        head :no_content
    end

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    private

    def instructors_params
        params.permit(:name)
    end



end
