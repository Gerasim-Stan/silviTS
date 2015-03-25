require 'rails_helper'

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

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryGirl.attributes_for(:event) }

      it "creates new event" do
        expect { post :create, event: valid_attributes }
                 .to change(Event, :count).by(1)
      end

      it "assigns newly created event as event" do
        post :create, event: valid_attributes
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to list of all events" do
        post :create, event: valid_attributes
        expect(response).to redirect_to "/events"
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_event) }

      it "does not save the new event" do
        expect { post :create, event: invalid_attributes }
                .to_not change(Event, :count)
      end

      it "re-renders the 'new' template" do
        post :create, event: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryGirl.attributes_for(:event) }
      let(:preset_attributes) { FactoryGirl.attributes_for(:event, name: "Monthly trip with provisions", description: "Yet another list of challenges for the month to come.") }

      it "finds the requested event" do
        put :update, id: event, event: valid_attributes
        expect(assigns(:event)).to eq(event)
      end

      it "changes event's attributes" do
        put :update, id: event, event: preset_attributes
        event.reload
        expect(event.name).to eq("Monthly trip with provisions")
        expect(event.description).to eq("Yet another list of challenges for the month to come.")
      end

      it "assigns the requested event as event" do
        put :update, id: event, event: valid_attributes
        expect(assigns(:event)).to eq(event)
      end

      it "redirects to list of all events" do
        put :update, id: event, event: valid_attributes
        expect(response).to redirect_to "/events"
      end
    end

    describe "with invalid attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_event) }

      it "finds the requested event" do
        put :update, id: event, event: invalid_attributes
        expect(assigns(:event)).to eq(event)
      end

      it "assigns the event as event" do
        put :update, id: event, event: invalid_attributes
        expect(assigns(:event)).to eq(event)
      end

      it "does not change event's attributes" do
        put :update, id: event, event: invalid_attributes
        event.reload
        expect(event.id).to          be_truthy
        expect(event.name).to        be_truthy
        expect(event.description).to be_truthy
      end

      it "re-renders the 'edit' template" do
        put :update, id: event, event: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      expect { delete :destroy, id: event }
              .to change(Event, :count).by(- 1)
    end

    it "redirects to the events list" do
      delete :destroy, id: event
      expect(response).to redirect_to events_url
    end
  end
end
