class CoursesController < ApplicationController

  def index
    @course =  Course.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @course = Course.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def create
    @course =  Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'El Curso ha sido creado exitosamente.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(course_params)
        format.html { redirect_to @course, notice: 'El curso ha sido actualizado exitosamente.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  private

def set_course
  @course = Course.find(params[:id])
end

def course_params
  params.require(:course).permit!
end


end
