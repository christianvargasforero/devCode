class SubjectsController < ApplicationController

  def index
    @subjects =  Subject.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @subject = Subject.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @subject = Subject.new
    respond_to do |format|
      format.html
    end
  end


  def create
    @subject =  Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'La materia ha sido creado exitosamente.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  private

def set_course
  @subject = Subject.find(params[:id])
end

def subject_params
  params.require(:subject).permit!
end


end
