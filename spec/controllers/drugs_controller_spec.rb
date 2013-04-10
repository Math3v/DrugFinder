require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DrugsController do

  # This should return the minimal set of attributes required to create a valid
  # Drug. As you add validations to Drug, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DrugsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all drugs as @drugs" do
      drug = Drug.create! valid_attributes
      get :index, {}, valid_session
      assigns(:drugs).should eq([drug])
    end
  end

  describe "GET show" do
    it "assigns the requested drug as @drug" do
      drug = Drug.create! valid_attributes
      get :show, {:id => drug.to_param}, valid_session
      assigns(:drug).should eq(drug)
    end
  end

  describe "GET new" do
    it "assigns a new drug as @drug" do
      get :new, {}, valid_session
      assigns(:drug).should be_a_new(Drug)
    end
  end

  describe "GET edit" do
    it "assigns the requested drug as @drug" do
      drug = Drug.create! valid_attributes
      get :edit, {:id => drug.to_param}, valid_session
      assigns(:drug).should eq(drug)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Drug" do
        expect {
          post :create, {:drug => valid_attributes}, valid_session
        }.to change(Drug, :count).by(1)
      end

      it "assigns a newly created drug as @drug" do
        post :create, {:drug => valid_attributes}, valid_session
        assigns(:drug).should be_a(Drug)
        assigns(:drug).should be_persisted
      end

      it "redirects to the created drug" do
        post :create, {:drug => valid_attributes}, valid_session
        response.should redirect_to(Drug.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved drug as @drug" do
        # Trigger the behavior that occurs when invalid params are submitted
        Drug.any_instance.stub(:save).and_return(false)
        post :create, {:drug => {}}, valid_session
        assigns(:drug).should be_a_new(Drug)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Drug.any_instance.stub(:save).and_return(false)
        post :create, {:drug => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested drug" do
        drug = Drug.create! valid_attributes
        # Assuming there are no other drugs in the database, this
        # specifies that the Drug created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Drug.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => drug.to_param, :drug => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested drug as @drug" do
        drug = Drug.create! valid_attributes
        put :update, {:id => drug.to_param, :drug => valid_attributes}, valid_session
        assigns(:drug).should eq(drug)
      end

      it "redirects to the drug" do
        drug = Drug.create! valid_attributes
        put :update, {:id => drug.to_param, :drug => valid_attributes}, valid_session
        response.should redirect_to(drug)
      end
    end

    describe "with invalid params" do
      it "assigns the drug as @drug" do
        drug = Drug.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Drug.any_instance.stub(:save).and_return(false)
        put :update, {:id => drug.to_param, :drug => {}}, valid_session
        assigns(:drug).should eq(drug)
      end

      it "re-renders the 'edit' template" do
        drug = Drug.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Drug.any_instance.stub(:save).and_return(false)
        put :update, {:id => drug.to_param, :drug => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested drug" do
      drug = Drug.create! valid_attributes
      expect {
        delete :destroy, {:id => drug.to_param}, valid_session
      }.to change(Drug, :count).by(-1)
    end

    it "redirects to the drugs list" do
      drug = Drug.create! valid_attributes
      delete :destroy, {:id => drug.to_param}, valid_session
      response.should redirect_to(drugs_url)
    end
  end

end
