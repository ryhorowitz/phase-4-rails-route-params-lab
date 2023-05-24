class StudentsController < ApplicationController
  def index
    if params[:name]
      name = params[:name].titleize
      students = Student.where(first_name: name).or(Student.where(last_name: name))
      # byebug
      render json: students
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
