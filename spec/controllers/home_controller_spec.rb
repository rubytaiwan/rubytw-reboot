require "rails_helper"

RSpec.describe HomeController do
  describe "#welcome" do
    it "works" do
      get :welcome

      expect(response).to render_template(:welcome)
      expect(response).to be_success
    end
  end
end
