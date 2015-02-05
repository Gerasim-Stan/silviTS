require 'rails_helper'
require 'spec_helper'

describe DestinationsController do
  let!(:destination) { FactoryGirl.create(:destination) }

  describe "GET #index" do
    it "returns list of destinations" do
      get :index
      expect(assigns(:destinations)).to eq([destination])
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested destination as destination" do
      get :show, id: destination
      expect(assigns(:destination)).to eq(destination)
    end

    it "renders the #show view" do
      get :show, id: destination
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested destination as destination" do
      get :edit, id: destination
      expect(assigns(:destination)).to eq(destination)
    end

    it "renders the #edit view" do
      get :edit, id: destination
      expect(response).to render_template :edit
    end
  end

  describe "GET #new" do
    it "assigns name to new destination" do
      get :new
      expect(response).to render_template :new
      expect(assigns(:destination)).to be_a_new Destination
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryGirl.attributes_for(:destination) }

      it "creates new destination" do
        expect { post :create, destination: valid_attributes }
                .to change(Destination, :count).by(1)
      end

      it "redirects to the new destination" do
        post :create, destination: valid_attributes
        expect(response).to redirect_to Destination.last
      end
    end

    context "with invalid attributes" do
      let(:get_invalid_attributes) { FactoryGirl.attributes_for(:invalid_destination) }

      it "does not save the new destination" do
        expect { post :create, destination: get_invalid_attributes }
                .to_not change(Destination, :count)
      end

      it "re-renders the 'new' template" do
        post :create, destination: get_invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do
      let(:valid_attributes)   { FactoryGirl.attributes_for(:destination) }
      let(:preset_attributes)  { FactoryGirl.attributes_for(:destination, name: "Mogadishu") }

      it "finds the requested destination" do
        put :update, id: destination, destination: valid_attributes
        expect(assigns(:destination)).to eq(destination)
      end

      it "changes destination's attributes" do
        put :update, id: destination, destination: preset_attributes
        destination.reload
        expect(destination.name).to eq("Mogadishu")
      end

      it "redirects to the updated destination" do
        put :update, id: destination, destination: valid_attributes
        expect(response).to redirect_to (destination)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_destination) }

      it "finds the requested destination" do
        put :update, id: destination, destination: invalid_attributes
        expect(assigns(:destination)).to eq(destination)
      end

      it "does not change destination's attributes" do
        put :update, id: destination, destination: invalid_attributes
        destination.reload
        expect(destination.id).to   be_truthy
        expect(destination.name).to be_truthy
      end

      it "re-renders the edit method" do
        put :update, id: destination, destination: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the destination" do
      expect { delete :destroy, id: destination }
              .to change(Destination, :count).by(- 1)
    end

    it "redirects to destinations#index" do
      delete :destroy, id: destination
      expect(response).to redirect_to destinations_url
    end
  end
end

