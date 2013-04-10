require 'spec_helper'

describe "drugs/new" do
  before(:each) do
    assign(:drug, stub_model(Drug,
      :id => 1,
      :name => "MyString",
      :code => "MyString",
      :sukl_name => "MyString",
      :form => "MyString",
      :label => "MyString",
      :usage => "",
      :holder_id => 1,
      :supplier_id => 1
    ).as_new_record)
  end

  it "renders new drug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drugs_path, :method => "post" do
      assert_select "input#drug_id", :name => "drug[id]"
      assert_select "input#drug_name", :name => "drug[name]"
      assert_select "input#drug_code", :name => "drug[code]"
      assert_select "input#drug_sukl_name", :name => "drug[sukl_name]"
      assert_select "input#drug_form", :name => "drug[form]"
      assert_select "input#drug_label", :name => "drug[label]"
      assert_select "input#drug_usage", :name => "drug[usage]"
      assert_select "input#drug_holder_id", :name => "drug[holder_id]"
      assert_select "input#drug_supplier_id", :name => "drug[supplier_id]"
    end
  end
end
