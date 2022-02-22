class StudentsController < ApplicationController
  before_action :find_student, only: [:show]

  def show
  end

  private

  def student_params
    params.require(:student).permit(:role, :name, :teacher_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
