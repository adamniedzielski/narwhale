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
end
