require 'spec_helper'

describe "producers/edit" do
  before(:each) do
    @producer = assign(:producer, stub_model(Producer,
      :id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit producer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => producers_path(@producer), :method => "post" do
      assert_select "input#producer_id", :name => "producer[id]"
      assert_select "input#producer_name", :name => "producer[name]"
    end
  end
end
