# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    category 1
    charge_amount "9.99"
    insurance "9.99"
    info "MyText"
    token "MyString"
    status "MyString"

    association :sender, :factory => :user
    association :receiver, :factory => :user
    
    after(:build) do |package|
      package.create_sender_address(FactoryGirl.attributes_for(:address))
      package.create_receiver_address(FactoryGirl.attributes_for(:address))
    end
  end
end
