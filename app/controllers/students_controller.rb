class StudentsController < ApplicationController
  def index
    # If viewing students under a specific teacher
    if params[:teacher_id].present?
      @teacher = Teacher.find(params[:teacher_id])
      scope = @teacher.students
    else
      scope = Student.all
    end

    # Case-insensitive search (SQLite uses LIKE, Postgres uses ILIKE)
    if params[:q].present?
      adapter = ActiveRecord::Base.connection.adapter_name.downcase
      like_operator = adapter.include?('sqlite') ? 'LIKE' : 'ILIKE'
      query = "%#{params[:q]}%"
      scope = scope.where("first_name #{like_operator} ? OR last_name #{like_operator} ? OR email #{like_operator} ?", query, query, query)
    end

    # Optional filter by grade level
    scope = scope.where(grade_level: params[:grade_level]) if params[:grade_level].present?

    # Order alphabetically and paginate
    @students = scope.order(:last_name).page(params[:page]).per(20)
  end

  def show
    @student = Student.find(params[:id])
  end
end
