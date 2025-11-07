class TeachersController < ApplicationController
  def index
    # If viewing teachers within a specific school
    if params[:school_id].present?
      @school = School.find(params[:school_id])
      scope = @school.teachers
    else
      scope = Teacher.all
    end

    # Search by teacher name or subject (case-insensitive)
    if params[:q].present?
      adapter = ActiveRecord::Base.connection.adapter_name.downcase
      like_operator = adapter.include?('sqlite') ? 'LIKE' : 'ILIKE'
      query = "%#{params[:q]}%"
      scope = scope.where("first_name #{like_operator} ? OR last_name #{like_operator} ? OR subject #{like_operator} ?", query, query, query)
    end

    # Optional filter by subject (if dropdown or filter added later)
    scope = scope.where(subject: params[:subject]) if params[:subject].present?

    # Order alphabetically and paginate
    @teachers = scope.order(:last_name).page(params[:page]).per(20)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students.order(:last_name)
  end
end
