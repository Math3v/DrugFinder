require 'spec_helper'

describe "drugs/show" do
  before(:each) do
    @drug = assign(:drug, stub_model(Drug,
      :id => 1,
      :name => "Name",
      :code => "Code",
      :sukl_name => "Sukl Name",
      :form => "Form",
      :label => "Label",
      :usage => "",
      :holder_id => 2,
      :supplier_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Code/)
    rendered.should match(/Sukl Name/)
    rendered.should match(/Form/)
    rendered.should match(/Label/)
    rendered.should match(//)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
