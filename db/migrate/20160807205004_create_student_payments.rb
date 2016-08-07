class CreateStudentPayments < ActiveRecord::Migration
  def change
    create_table :student_payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.datetime :payment_date
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
