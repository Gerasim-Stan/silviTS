require 'rails_helper'

describe ReservationsController, type: :controller do
  transportation = FactoryGirl.create(:transportation)
  trip = FactoryGirl.create(:trip)
  let!(:reservation) { FactoryGirl.create(:reservation) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:reservation, transportation_id: transportation.id, trip_id: trip.id) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_reservation) }

  describe "GET #index" do
    it "returns list of reservation" do
      get :index
      expect(assigns(:reservations)).to eq(Reservation.all)
    end

    it "renders the #new view " do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested reservation as reservation" do
      get :show, id: reservation
      expect(assigns(:reservation)).to eq(reservation)
    end

    it "renders the #show view" do
      get :show, id: reservation
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new reservation as reservation" do
      get :new
      expect(assigns(:reservation)).to be_a_new(Reservation)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested reservation as @reservation" do
      get :edit, id: reservation
      expect(assigns(:reservation)).to eq(reservation)
    end

    it "renders the #edit template" do
      get :edit, id: reservation
      expect(response).to render_template :edit
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

      it "redirects to list of all reservations" do
        post :create, reservation: valid_attributes
        expect(response).to redirect_to reservations_url
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

      it "redirects to list of all reservations" do
        put :update, id: reservation, reservation: valid_attributes
        expect(response).to redirect_to reservations_url
      end
    end

    describe "with invalid attributes" do
      it "assigns the reservation as reservation" do
        put :update, id: reservation, reservation: invalid_attributes
        expect(assigns(:reservation)).to eq(reservation)
      end

      it "does not change reservation's attributes" do
        put :update, id: reservation, reservation: invalid_attributes
        reservation.reload
        expect(reservation).to be_persisted
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
      expect(response).to redirect_to reservations_url
    end
  end

end
