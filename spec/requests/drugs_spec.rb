require 'spec_helper'

describe "Drugs" do
  describe "GET /huuman_body" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/human_body'
      response.status.should be(200)
    end
  end
end
