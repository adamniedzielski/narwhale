require 'spec_helper'

describe Package do
  
  let(:package) { FactoryGirl.build(:package) }

  specify "fields" do
    expect(package).to respond_to(:category)
    expect(package).to respond_to(:charge_amount)
    expect(package).to respond_to(:insurance)
    expect(package).to respond_to(:info)
    expect(package).to respond_to(:token)
    expect(package).to respond_to(:status)
  end

  it "belongs to sender" do
    expect(package).to respond_to(:sender)
  end

  it "belongs to sender" do
    expect(package).to respond_to(:sender)
  end

  it "belongs to delivery man first" do
    expect(package).to respond_to(:delivery_man_first)
  end

  it "belongs to delivery man second" do
    expect(package).to respond_to(:delivery_man_second)
  end

  it "has one sender address" do
    expect(package).to respond_to(:sender_address)
  end

  it "has one receiver address" do
    expect(package).to respond_to(:receiver_address)
  end
end

