class AddStudentReferenceToStudentPayment < ActiveRecord::Migration
  def change
    add_reference :student_payments, :student, index: true, foreign_key: true
  end
end
