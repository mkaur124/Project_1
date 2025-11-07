class SchoolsController < ApplicationController
  def index
    @q = params[:q]
    per_page = (params[:per_page] || 20).to_i   # Allow user to select number of records per page
    scope = School.all

    # Search by name or city (case-insensitive)
    if @q.present?
      adapter = ActiveRecord::Base.connection.adapter_name.downcase
      like_operator = adapter.include?('sqlite') ? 'LIKE' : 'ILIKE'
      scope = scope.where("name #{like_operator} ? OR city #{like_operator} ?", "%#{@q}%", "%#{@q}%")
    end

    # Optional filtering by city (if you add a dropdown later)
    scope = scope.where(city: params[:city]) if params[:city].present?

    # Pagination with Kaminari
    @schools = scope.order(:name).page(params[:page]).per(per_page)
  end

  def show
    @school = School.find(params[:id])
    @teachers = @school.teachers.order(:last_name)
    # Students associated through teachers
    @students = Student.where(teacher_id: @school.teachers.pluck(:id)).order(:last_name)
  end
end
