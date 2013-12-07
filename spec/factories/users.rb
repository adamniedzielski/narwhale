
FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "admin123"
    address
  end
end