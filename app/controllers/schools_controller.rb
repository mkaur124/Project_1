class SchoolsController < ApplicationController
  def index
    @q = params[:q]
    scope = School.all
    scope = scope.where("name LIKE ? OR city LIKE ?", "%#{@q}%", "%#{@q}%") if @q.present?
    @schools = scope.order(:name).page(params[:page]).per(20)
  end

  def show
    @school = School.find(params[:id])
    @teachers = @school.teachers.order(:last_name)
  end
end
