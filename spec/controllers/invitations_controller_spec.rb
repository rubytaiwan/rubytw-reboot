require "rails_helper"

RSpec.describe InvitationsController do
  describe "#create" do
    context "success" do
      let(:successful_invitation) { double(create_and_send: true) }

      it "redirects and flash notice" do
        expect(Invitation).to receive(:new).and_return(successful_invitation)

        post :create, invitation: { email: "valid@mail.com" }

        expect(response).to redirect_to root_path
        expect(flash[:notice]).to include "邀請信已經送到您的信箱囉！很期待見到你！"
      end
    end

    context "failure" do
      let(:failed_invitation) { double(create_and_send: false, errors: spy) }

      it "redirects and flash alert" do
        expect(Invitation).to receive(:new).and_return(failed_invitation)

        post :create, invitation: { email: nil }

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to include "唉呦！出錯了..."
      end
    end
  end
end
