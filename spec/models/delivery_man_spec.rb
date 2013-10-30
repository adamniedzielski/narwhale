require 'spec_helper'

describe DeliveryMan do
  
  let(:delivery_man) { FactoryGirl.build(:delivery_man) }

  specify "fields" do
    expect(delivery_man).to respond_to(:symbol)
  end

  it "has many packages to receive" do
    expect(delivery_man).to respond_to(:packages_to_receive)
  end

  it "has many packages to deliver" do
    expect(delivery_man).to respond_to(:packages_to_deliver)
  end
end
