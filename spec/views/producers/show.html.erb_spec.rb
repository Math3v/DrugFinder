require 'spec_helper'

describe "producers/show" do
  before(:each) do
    @producer = assign(:producer, stub_model(Producer,
      :id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
