require 'rails_helper'
require 'spec_helper'

describe EventsController do
  let!(:event) { FactoryGirl.create(:event) }

  describe "GET #index" do
    it "returns list of events" do
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested event as event" do
      get :show, id: event
      expect(assigns(:event)).to eq(event)
    end

    it "renders the #show view" do
      get :show, id: event
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested event as event" do
      get :edit, id: event
      expect(assigns(:event)).to eq(event)
    end

    it "renders the #edit view" do
      get :edit, id: event
      expect(response).to render_template :edit
    end
  end

  describe "GET #new" do
    it "assigns name and description to new event" do
      get :new
      expect(response).to render_template :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}, valid_session
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}, valid_session
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}, valid_session
        expect(response).to redirect_to(Event.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        post :create, {:event => invalid_attributes}, valid_session
        expect(assigns(:event)).to be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        post :create, {:event => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => new_attributes}, valid_session
        event.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        expect(response).to redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => invalid_attributes}, valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}, valid_session
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_session
      expect(response).to redirect_to(events_url)
    end
  end
end
