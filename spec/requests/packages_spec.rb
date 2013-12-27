require 'spec_helper'

describe "Packages", :authenticate => true do
  describe "#create" do

    before do
      @sender = FactoryGirl.create(:user)
    end

    context "when receiver is not in system" do

      let(:request) do
        Proc.new do
          post packages_path, 
               :sender_id => @sender.id,
               :receiver => FactoryGirl.attributes_for(:user),
               :receiver_address => FactoryGirl.attributes_for(:address),
               :package => FactoryGirl.attributes_for(:package)
        end
      end

      it "creates user" do
        expect { request.call }.to change { User.count }.by(1)
      end

      it "creates non-registered user" do
        request.call
        expect(User.last.registered).to be_false
      end

      it "creates package" do
        expect { request.call }.to change { Package.count }.by(1)
      end      

      it "copies sender address to package" do
        request.call
        sender_address = Package.last.sender_address
        expect(sender_address).to be_present
        expect(sender_address.id).not_to eq(@sender.reload.address)
      end

      it "assigns receiver address to package" do
        request.call
        expect(Package.last.receiver_address).to be_present
      end
    end

    context "when receiver is present in system" do

      before do
        @receiver = FactoryGirl.create(:user)
      end

      let(:request) do
        Proc.new do
          post packages_path, 
               :sender_id => @sender.id,
               :receiver => @receiver.attributes,
               :receiver_address => FactoryGirl.attributes_for(:address),
               :package => FactoryGirl.attributes_for(:package)
        end
      end

      it "assigns package to receiver" do
        expect { request.call }.to change { @receiver.received_packages.count }.by(1)
      end

      it "assigns package to sender" do
        expect { request.call }.to change { @sender.sent_packages.count }.by(1)
      end

      it "marks created package as New" do
        request.call
        expect(Package.last.status).to eq 'New'
      end

      it "generates token for created package" do
        request.call
        expect(Package.last.token).to be_present
      end
    end

  end

  describe "#update" do

    before do
      @package = FactoryGirl.create(:package)
      @delivery_man = FactoryGirl.create(:delivery_man)
    end

    it "assigns delivery man to package" do
      patch package_path(@package), :package => { :delivery_man_first_id => @delivery_man.id }
      expect(@package.reload.delivery_man_first.id).to eq @delivery_man.id
    end
  end
end
