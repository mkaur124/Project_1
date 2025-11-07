class SchoolsController < ApplicationController
  def index
    @q = params[:q]
    scope = School.all

    # Search by name or city (case-insensitive)
    if @q.present?
      adapter = ActiveRecord::Base.connection.adapter_name.downcase
      like_operator = adapter.include?('sqlite') ? 'LIKE' : 'ILIKE'
      scope = scope.where("name #{like_operator} ? OR city #{like_operator} ?", "%#{@q}%", "%#{@q}%")
    end

    # Optional filtering by city (if filter dropdown is added later)
    scope = scope.where(city: params[:city]) if params[:city].present?

    # Pagination with Kaminari
    @schools = scope.order(:name).page(params[:page]).per(20)
  end

  def show
    @school = School.find(params[:id])
    @teachers = @school.teachers.order(:last_name)
    @students = @school.students.order(:last_name) if @school.respond_to?(:students)
  end
end
