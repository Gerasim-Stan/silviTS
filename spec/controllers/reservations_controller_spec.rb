require 'rails_helper'
require 'spec_helper'

describe ReservationsController do
  transportation = FactoryGirl.create(:transportation)
  trip = FactoryGirl.create(:trip)
  let!(:reservation) { FactoryGirl.create(:reservation) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:reservation, transportation_id: transportation.id, trip_id: trip.id) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_reservation) }

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

  describe "POST #create" do
    context "with valid attributes" do
      it "creates new reservation" do
        expect { post :create, reservation: valid_attributes }
                .to change(Reservation, :count).by(1)
      end

      it "assigns newly created reservation as reservation" do
        post :create, reservation: valid_attributes
        expect(assigns(:reservation)).to be_a(Reservation)
        expect(assigns(:reservation)).to be_persisted
      end

      it "redirects to the created reservation" do
        post :create, reservation: valid_attributes
        expect(response).to redirect_to(Reservation.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new reservation" do
        post :create, reservation: invalid_attributes
        expect(assigns(:reservation)).to be_a_new(Reservation)
      end

      it "re-renders the 'new' template" do
        post :create, reservation: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      let(:preset_attributes) { FactoryGirl.attributes_for(:reservation, trip_id: trip.id, transportation_id: transportation.id, name: "John") }

      it "finds the requested reservation" do
        put :update, id: reservation, reservation: valid_attributes
        expect(assigns(:reservation)).to eq reservation
      end

      it "changes reservation's attribute 'name'" do
        put :update, id: reservation, reservation: preset_attributes
        reservation.reload
        expect(reservation).to be_persisted
        expect(reservation.name).to eq "John"
      end

      it "assigns the requested reservation as reservation" do
        put :update, id: reservation, reservation: valid_attributes
        expect(assigns(:reservation)).to eq(reservation)
      end

      it "redirects to the reservation" do
        put :update, id: reservation, reservation: valid_attributes
        expect(response).to redirect_to(reservation)
      end
    end

    describe "with invalid params" do
      it "assigns the reservation as @reservation" do
        put :update, id: reservation, reservation: invalid_attributes
        expect(assigns(:reservation)).to eq(reservation)
      end

      it "re-renders the 'edit' template" do
        put :update, id: reservation, reservation: invalid_attributes
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested reservation" do
      expect { delete :destroy, id: reservation }
              .to change(Reservation, :count).by(- 1)
    end

    it "redirects to the reservations list" do
      delete :destroy, id: reservation
      expect(response).to redirect_to(reservations_url)
    end
  end

end
