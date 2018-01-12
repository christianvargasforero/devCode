class AddStudentIdAndSubjectIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :student_id, :integer
    add_column :notes, :subject_id, :integer
  end
end
