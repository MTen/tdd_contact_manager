# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |n| "johndoe#{n}@example.com"}
  end
end
