require "rails_helper"

RSpec.describe Invitation do
  context "validations" do
    it { is_expected.to validate_presence_of :email }
  end

  describe "#create_and_send" do
    describe "valid" do
      before do
        stub_request(:post, Invitation::URL).to_return(
          status: 200,
          body: body,
          headers: { 'content-type': ["application/json; charset=utf-8"] })
      end
      let(:email) { "abc@example.com" }

      context "success" do
        let(:body) { { ok: true }.to_json }

        it "returns true without errors" do
          invitation = Invitation.new(email: email)
          expect(invitation.create_and_send).to be_truthy
          expect(invitation.errors).to be_blank
        end
      end

      context "failure" do
        let(:body) { { ok: false, error: "not_authed" }.to_json }

        it "returns false with errors" do
          invitation = Invitation.new(email: email)
          expect(invitation.create_and_send).to be_falsey
          expect(invitation.errors[:email]).to be_present
        end
      end
    end

    context "invalid" do
      it "returns false with errors" do
        invitation = Invitation.new(email: nil)
        expect(invitation.create_and_send).to be_falsey
        expect(invitation.errors[:email]).to be_present
      end
    end
  end
end
