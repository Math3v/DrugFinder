require 'spec_helper'

describe "drugs/index" do
  before(:each) do
    assign(:drugs, [
      stub_model(Drug,
        :id => 1,
        :name => "Name",
        :code => "Code",
        :sukl_name => "Sukl Name",
        :form => "Form",
        :label => "Label",
        :usage => "",
        :holder_id => 2,
        :supplier_id => 3
      ),
      stub_model(Drug,
        :id => 1,
        :name => "Name",
        :code => "Code",
        :sukl_name => "Sukl Name",
        :form => "Form",
        :label => "Label",
        :usage => "",
        :holder_id => 2,
        :supplier_id => 3
      )
    ])
  end

  it "renders a list of drugs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Sukl Name".to_s, :count => 2
    assert_select "tr>td", :text => "Form".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
