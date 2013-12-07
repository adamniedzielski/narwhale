# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    category 1
    charge_amount "9.99"
    insurance "9.99"
    info "MyText"
    token "MyString"
    status "MyString"
  end
end
