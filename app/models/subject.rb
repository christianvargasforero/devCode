class Subject < ApplicationRecord
  has_many :notes, :foreign_key => 'id'
  belongs_to :course, optional: true
end
