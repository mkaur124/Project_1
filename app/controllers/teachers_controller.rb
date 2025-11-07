class TeachersController < ApplicationController
  def index
    if params[:school_id]
      @school = School.find(params[:school_id])
      scope = @school.teachers
    else
      scope = Teacher.all
    end
    @teachers = scope.order(:last_name).page(params[:page]).per(20)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students.order(:last_name)
  end
end
