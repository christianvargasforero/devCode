class StudentsController < ApplicationController

  def index
    @students =  Student.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @student = Student.new
    respond_to do |format|
      format.html
    end
  end


  def create
    @student =  Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'El estudiante ha sido creado exitosamente.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update_attributes(student_params)
        format.html { redirect_to @student, notice: 'El estudiente ha sido actualizado exitosamente.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  private

def set_student
  @student = Student.find(params[:id])
end

def student_params
  params.require(:student).permit!
end


end
