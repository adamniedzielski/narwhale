require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.build(:user) }

  specify "fields" do
    expect(user).to respond_to(:first_name)
    expect(user).to respond_to(:last_name)
    expect(user).to respond_to(:email)
    expect(user).to respond_to(:password_hash)
    expect(user).to respond_to(:registered)
    expect(user).to respond_to(:nip)
  end

  it "has one address" do
    expect(user).to respond_to(:address)
  end

  it "has many sent packages" do
    expect(user).to respond_to(:sent_packages)
  end

  it "has many received packages" do
    expect(user).to respond_to(:received_packages)
  end
end
