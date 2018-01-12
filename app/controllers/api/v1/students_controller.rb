module Api
  module V1
    class StudentsController < Api::BaseController

      def index
        
        @allS = []
        @students =  Student.all
        #@courses = Student.course
        
        @students.each do |s|
          subj = []
          notes = Note.where(:student_id => s.id).to_a

          s.courses.each do |c|
            subj.push(c.subjects.to_a)
          end
          obj = {"student" => s, "Courses" => s.courses.to_a, "Sunjects" => subj, "Notes" => notes}
          

          @allS.push(obj)
        end
        p "@allS"
        p @allS
        render :json=> {:students =>@allS }, :status => :ok
      end



    end
  end
end
