require 'spec_helper'

describe "Authentication" do
  
  context "as regular client" do

    let(:user) { FactoryGirl.create(:user) }

    context "with correct authentication key" do

      let(:authentication_key) { Rails.application.config.regular_key }

      it "should grant access" do
        get user_path(user), :authentication_key => authentication_key
        expect(response.status).to eq 200
      end
    end

    context "with incorrect authentication key" do

      let(:authentication_key) { "XXX" }

      it "should respond with error" do
        get user_path(user), :authentication_key => authentication_key
        expect(response.status).to eq 500
      end
    end
  end

  context "as admin client" do

    context "with correct authentication key" do

      let(:authentication_key) { Rails.application.config.admin_key }

      it "should grant access" do
        get delivery_men_path, :authentication_key => authentication_key
        expect(response.status).to eq 200
      end
    end

    context "with incorrect authentication key" do

      let(:authentication_key) { "XXX" }

      it "should respond with error" do
        get delivery_men_path, :authentication_key => authentication_key
        expect(response.status).to eq 500
      end
    end
  end
end