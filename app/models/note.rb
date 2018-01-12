class Note < ApplicationRecord
  belongs_to :student, inverse_of: :notes, optional: true
  belongs_to :subject, inverse_of: :notes, optional: true
  belongs_to :course, optional: true
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :subject
  accepts_nested_attributes_for :course
end
