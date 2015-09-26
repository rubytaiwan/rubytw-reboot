require "rails_helper"

RSpec.describe InvitationsController do
  describe "#create" do
    context "success" do
      before do
        allow_any_instance_of(Invitation).to receive(:create_and_send).and_return(true)
      end
      it "works" do
        post :create, invitation: { email: "valid@mail.com" }
        expect(response).to redirect_to(:root)
        expect(flash[:notice]).to be_present
      end
    end

    context "fail" do
      before do
        allow_any_instance_of(Invitation).to receive(:create_and_send).and_return(false)
      end
      it "works" do
        post :create, invitation: { email: nil }
        expect(response).to redirect_to(:root)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
