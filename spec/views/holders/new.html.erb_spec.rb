require 'spec_helper'

describe "holders/new" do
  before(:each) do
    assign(:holder, stub_model(Holder,
      :id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new holder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => holders_path, :method => "post" do
      assert_select "input#holder_id", :name => "holder[id]"
      assert_select "input#holder_name", :name => "holder[name]"
    end
  end
end
