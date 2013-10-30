require 'spec_helper'

describe Address do

  let(:address) { FactoryGirl.build(:address) }

  specify "fields" do
    expect(address).to respond_to(:first_line)
    expect(address).to respond_to(:second_line)
    expect(address).to respond_to(:city)
    expect(address).to respond_to(:postal_code)
    expect(address).to respond_to(:phone_number)
    expect(address).to respond_to(:category)
  end

  it "belongs to addressable" do
    expect(address).to respond_to(:addressable)
  end
end
