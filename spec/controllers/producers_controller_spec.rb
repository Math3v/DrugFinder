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

describe ProducersController do

  # This should return the minimal set of attributes required to create a valid
  # Producer. As you add validations to Producer, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProducersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all producers as @producers" do
      producer = Producer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:producers).should eq([producer])
    end
  end

  describe "GET show" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      get :show, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "GET new" do
    it "assigns a new producer as @producer" do
      get :new, {}, valid_session
      assigns(:producer).should be_a_new(Producer)
    end
  end

  describe "GET edit" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      get :edit, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Producer" do
        expect {
          post :create, {:producer => valid_attributes}, valid_session
        }.to change(Producer, :count).by(1)
      end

      it "assigns a newly created producer as @producer" do
        post :create, {:producer => valid_attributes}, valid_session
        assigns(:producer).should be_a(Producer)
        assigns(:producer).should be_persisted
      end

      it "redirects to the created producer" do
        post :create, {:producer => valid_attributes}, valid_session
        response.should redirect_to(Producer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved producer as @producer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => {}}, valid_session
        assigns(:producer).should be_a_new(Producer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested producer" do
        producer = Producer.create! valid_attributes
        # Assuming there are no other producers in the database, this
        # specifies that the Producer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Producer.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => producer.to_param, :producer => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested producer as @producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "redirects to the producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        response.should redirect_to(producer)
      end
    end

    describe "with invalid params" do
      it "assigns the producer as @producer" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => {}}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "re-renders the 'edit' template" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested producer" do
      producer = Producer.create! valid_attributes
      expect {
        delete :destroy, {:id => producer.to_param}, valid_session
      }.to change(Producer, :count).by(-1)
    end

    it "redirects to the producers list" do
      producer = Producer.create! valid_attributes
      delete :destroy, {:id => producer.to_param}, valid_session
      response.should redirect_to(producers_url)
    end
  end

end
