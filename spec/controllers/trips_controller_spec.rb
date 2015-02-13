require 'rails_helper'
require 'spec_helper'

describe TripsController do
  let!(:trip) { FactoryGirl.create(:trip) }

  describe "GET #index" do
    it "returns list of trips" do
      get :index
      expect(assigns(:trips)).to eq([trip])
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested trip as trip" do
      get :show, id: trip
      expect(assigns(:trip)).to eq(trip)
    end

    it "renders the #show view" do
      get :show, id: trip
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested trip as trip" do
      get :edit, id: trip
      expect(assigns(:trip)).to eq(trip)
    end

    it "renders the #edit view" do
      get :edit, id: trip
      expect(response).to render_template :edit
    end
  end

  describe "GET #new" do
    it "assigns adequate attributes to new trip" do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end

    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
  end

=begin
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trip" do
        expect {
          post :create, {:trip => valid_attributes}, valid_session
        }.to change(Trip, :count).by(1)
      end

      it "assigns a newly created trip as @trip" do
        post :create, {:trip => valid_attributes}, valid_session
        expect(assigns(:trip)).to be_a(Trip)
        expect(assigns(:trip)).to be_persisted
      end

      it "redirects to the created trip" do
        post :create, {:trip => valid_attributes}, valid_session
        expect(response).to redirect_to(Trip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trip as @trip" do
        post :create, {:trip => invalid_attributes}, valid_session
        expect(assigns(:trip)).to be_a_new(Trip)
      end

      it "re-renders the 'new' template" do
        post :create, {:trip => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested trip" do
        put :update, {:id => trip.to_param, :trip => new_attributes}, valid_session
        trip.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested trip as @trip" do
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        expect(assigns(:trip)).to eq(trip)
      end

      it "redirects to the trip" do
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        expect(response).to redirect_to(trip)
      end
    end

    describe "with invalid params" do
      it "assigns the trip as @trip" do
        put :update, {:id => trip.to_param, :trip => invalid_attributes}, valid_session
        expect(assigns(:trip)).to eq(trip)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => trip.to_param, :trip => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trip" do
      expect {
        delete :destroy, {:id => trip.to_param}, valid_session
      }.to change(Trip, :count).by(-1)
    end

    it "redirects to the trips list" do
      delete :destroy, {:id => trip.to_param}, valid_session
      expect(response).to redirect_to(trips_url)
    end
  end
=end
end
