FactoryGirl.define do
  factory :student_payment do
    amount { Faker::Number.decimal(2) }
    payment_date "2016-08-07 22:50:04"
    due_date "2016-08-07 22:50:04"
  end
end
