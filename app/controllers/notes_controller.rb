class NotesController < ApplicationController

  def index
    @notes =  Note.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @note = Note.new
    respond_to do |format|
      format.html
    end
  end


  def create
    
    @student = Student.find(params[:note][:student])
    @course = Course.find(params[:note][:course])
    @subject = Subject.find(params[:note][:subject])
    @value = params[:note][:value]
    @note =  Note.new

    if validate_note(@value) == true
      @note.student = @student
      @note.course = @course
      @note.subject = @subject 
      @note.value = @value 

      respond_to do |format|
        if @note.save
          format.html { redirect_to @note }
        else
          format.html { render action: "new" }
        end
      end
    else 

    flash[:notice] = "!!!!! Error de Validacion la nota ingresada es: #{@value} la hora es: #{@now} los minutos son #{@minutes} la validacion es #{@validation} "
    render action: "new"
    end
  end

  def validate_note(value)
    @now = Time.now
    @minutes = @now.strftime('%M').to_i
    @tStudents = Student.all.count.to_i

    @validation = @minutes + @tStudents

    if value.to_i < @validation
      return true
    else 
      return false 
    end
  end

  private

def set_course
  @note = Note.find(params[:id])
end

def course_params
  params.require(:note).permit!
end


end
