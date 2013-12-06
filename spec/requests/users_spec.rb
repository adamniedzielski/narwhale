require 'spec_helper'

describe "Users", :authenticate => true do

  describe "#authenticate" do
    
    before do
      @user = FactoryGirl.create(:user)
    end

    context "with invalid email" do

      before do
        post authenticate_users_path, :email => "invalid@invalid.com"
      end

      it "returns user not found" do
        expect(response).to be_error
        expect(json['error']).to eq "Email not found"
      end
    end

    context "with invalid password" do

      before do
        post authenticate_users_path, :email => @user.email, :password => "invalid"
      end

      it "returns invalid password" do
        expect(response).to be_error
        expect(json['error']).to eq "Password invalid"
      end
    end

    context "with valid email and password" do

      before do
        post authenticate_users_path, :email => @user.email, :password => "admin123"
      end

      it "returns user record" do
        expect(response.code).to eq "200"
        expect(json['user']['id']).to eq @user.id
      end
    end
  end

  describe "#packages" do

    before do
      @user = FactoryGirl.build(:user)
      @sent = FactoryGirl.build(:package)
      @user.sent_packages << @sent
      @received = FactoryGirl.build(:package)
      @user.received_packages << @received
      @user.save!
    end

    it "returns sent and received packages for user" do
      get packages_user_path(@user)
      expect(json["user_packages"]["sent_packages"].first["id"]).to eq @sent.id
      expect(json["user_packages"]["received_packages"].first["id"]).to eq @received.id
    end
  end

  describe "#create" do

    let(:request) do
      Proc.new do
        post users_path,
             :user => FactoryGirl.attributes_for(:user),
             :address => FactoryGirl.attributes_for(:address)
      end
    end

    it "creates new user" do
      expect { request.call }.to change { User.count }.by(1)
    end

    it "assigns address to new user" do
      request.call
      expect(User.last.address).to be_present
    end

    it "marks new user as registered" do
      request.call
      expect(User.last.registered).to be_true
    end
  end
end
