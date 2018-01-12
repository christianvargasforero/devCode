class Student < ApplicationRecord
  has_many :courses, :foreign_key => 'id'
  belongs_to :notes, optional: true
end
