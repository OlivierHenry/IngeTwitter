require 'spec_helper'

describe "FriendlyForwardings" do
  describe "GET /friendly_forwardings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get friendly_forwardings_path
      response.status.should be(200)
    end
  end
end
