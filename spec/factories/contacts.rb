# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name 'Mike'
    last_name 'Tener'
    sequence(:email) { |n| "johndoe#{n}@example.com"}
  end
end
