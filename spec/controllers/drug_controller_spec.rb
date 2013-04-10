require 'spec_helper'

describe DrugController do

  describe "GET 'find'" do
    it "returns http success" do
      get 'find'
      response.should be_success
    end
  end

end
