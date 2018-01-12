class Course < ApplicationRecord
  has_many :subjects, :foreign_key => 'id'
  belongs_to :notes, optional: true
end
