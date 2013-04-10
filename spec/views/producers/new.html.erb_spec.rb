require 'spec_helper'

describe "producers/new" do
  before(:each) do
    assign(:producer, stub_model(Producer,
      :id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new producer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => producers_path, :method => "post" do
      assert_select "input#producer_id", :name => "producer[id]"
      assert_select "input#producer_name", :name => "producer[name]"
    end
  end
end
