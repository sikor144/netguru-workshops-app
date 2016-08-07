FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Date.new(1995, 11, 10).to_formatted_s(:db) }
  end
end
