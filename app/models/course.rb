class Course < ApplicationRecord
  #belongs_to :student, :foreign_key => 'id'
  has_many :subjects, :foreign_key => 'id'
  belongs_to :notes, optional: true
  #has_many :notes
end
