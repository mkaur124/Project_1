class StudentsController < ApplicationController
  def index
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      scope = @teacher.students
    else
      scope = Student.all
    end
    @students = scope.order(:last_name).page(params[:page]).per(20)
  end

  def show
    @student = Student.find(params[:id])
  end
end
