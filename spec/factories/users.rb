
FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "admin123"
    first_name "test"
    last_name "test"

    after(:build) { |user| user.create_address(FactoryGirl.attributes_for(:address)) }
  end
end