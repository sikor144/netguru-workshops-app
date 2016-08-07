class StudentPayment < ActiveRecord::Base
  belongs_to :student

  validates :amount, :student_id, presence: true
end
