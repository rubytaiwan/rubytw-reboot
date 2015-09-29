require "rails_helper"

RSpec.describe Invitation do
  context "validations" do
    it { is_expected.to validate_presence_of :email }
  end

  describe "#create_and_send" do
    let(:email) { "david@example.com" }

    def stub_invitation_request
      stub_request(
        :post, Invitation::URL
      ).to_return(
        status: 200,
        body: body,
        headers: { "content-type": "application/json" }
      )
    end

    context "success" do
      let(:body) { Hash(ok: true).to_json }

      it "returns true without errors" do
        stub_invitation_request

        invitation = Invitation.new(email: email)

        expect(invitation.create_and_send).to be_truthy
        expect(invitation.errors).to be_blank
      end
    end

    context "failure" do
      let(:body) { Hash(ok: false, error: "not_authed").to_json }

      it "returns false with errors" do
        stub_invitation_request

        invitation = Invitation.new(email: email)

        expect(invitation.create_and_send).to be_falsey
        expect(invitation.errors[:email]).to be_present
      end
    end

    context "invalid" do
      let(:email) { nil }

      it "returns false with errors" do
        invitation = Invitation.new(email: email)

        expect(invitation.create_and_send).to be_falsey
        expect(invitation.errors[:email]).to be_present
      end
    end
  end
end
