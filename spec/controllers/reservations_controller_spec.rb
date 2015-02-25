require 'rails_helper'
require 'spec_helper'

describe ReservationsController do
  let!(:reservation) { FactoryGirl.create(:reservation) }

  describe "GET index" do
    it "assigns all reservations as @reservations" do
      get :index
      expect(assigns(:reservations)).to eq([reservation])
    end
  end

  describe "GET show" do
    it "assigns the requested reservation as @reservation" do

      get :show, id: reservation
      expect(assigns(:reservation)).to eq(reservation)
    end
  end

  describe "GET new" do
    it "assigns a new reservation as @reservation" do
      get :new
      expect(assigns(:reservation)).to be_a_new(Reservation)
    end
  end

  describe "GET edit" do
    it "assigns the requested reservation as @reservation" do
      get :edit, id: reservation
      expect(assigns(:reservation)).to eq(reservation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reservation" do
        expect {
          post :create, {:reservation => valid_attributes}
        }.to change(Reservation, :count).by(1)
      end

      it "assigns a newly created reservation as @reservation" do
        post :create, {:reservation => valid_attributes}
        expect(assigns(:reservation)).to be_a(Reservation)
        expect(assigns(:reservation)).to be_persisted
      end

      it "redirects to the created reservation" do
        post :create, {:reservation => valid_attributes}
        expect(response).to redirect_to(Reservation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reservation as @reservation" do
        post :create, {:reservation => invalid_attributes}
        expect(assigns(:reservation)).to be_a_new(Reservation)
      end

      it "re-renders the 'new' template" do
        post :create, {:reservation => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested reservation" do
  
        put :update, {:id => reservation.to_param, :reservation => new_attributes}
        reservation.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested reservation as @reservation" do
  
        put :update, {:id => reservation.to_param, :reservation => valid_attributes}
        expect(assigns(:reservation)).to eq(reservation)
      end

      it "redirects to the reservation" do
  
        put :update, {:id => reservation.to_param, :reservation => valid_attributes}
        expect(response).to redirect_to(reservation)
      end
    end

    describe "with invalid params" do
      it "assigns the reservation as @reservation" do
  
        put :update, {:id => reservation.to_param, :reservation => invalid_attributes}
        expect(assigns(:reservation)).to eq(reservation)
      end

      it "re-renders the 'edit' template" do
  
        put :update, {:id => reservation.to_param, :reservation => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reservation" do

      expect {
        delete :destroy, id: reservation
      }.to change(Reservation, :count).by(-1)
    end

    it "redirects to the reservations list" do

      delete :destroy, id: reservation
      expect(response).to redirect_to(reservations_url)
    end
  end

end
