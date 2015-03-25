require 'rails_helper'

describe TransportationsController, type: :controller do
  let!(:transportation) { FactoryGirl.create(:transportation) }

  describe "GET #index" do
    it "returns list of transportations" do
      get :index
      expect(assigns(:transportations)).to eq(Transportation.all)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested transportation as transportation" do
      get :show, id: transportation
      expect(assigns(:transportation)).to eq(transportation)
    end

    it "renders the #show view" do
      get :show, id: transportation
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested transportation as transportation" do
      get :edit, id: transportation
      expect(assigns(:transportation)).to eq(transportation)
    end

    it "renders the #edit view" do
      get :edit, id: transportation
      expect(response).to render_template :edit
    end
  end

  describe "GET #new" do
    it "assigns valid attributes to new transportation" do
      get :new
      expect(assigns(:transportation)).to be_a_new(Transportation)
    end

    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryGirl.attributes_for(:transportation) }

      it "creates new transportation" do
        expect { post :create, transportation: valid_attributes }
                .to change(Transportation, :count).by(1)
      end

      it "assigns newly created transportation as transportation" do
        post :create, transportation: valid_attributes
        expect(assigns(:transportation)).to be_a(Transportation)
        expect(assigns(:transportation)).to be_persisted
      end

      it "redirects to list of all transportations" do
        post :create, transportation: valid_attributes
        expect(response).to redirect_to "/transportations"
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_transportation) }

      it "does not save new invalid transportation" do
        expect { post :create, transportation: invalid_attributes }
                .to_not change(Transportation, :count)
      end

      it "re-renders the #new template" do
        post :create, transportation: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:valid_attributes)  { FactoryGirl.attributes_for(:transportation) }
      let(:preset_attributes) { FactoryGirl.attributes_for(:transportation, description: "Valid description.") }

      it "finds the requested transportation" do
        put :update, id: transportation, transportation: valid_attributes
        expect(assigns(:transportation)).to eq(transportation)
      end

      it "changes transportation's attributes" do
        put :update, id: transportation, transportation: preset_attributes
        transportation.reload
        expect(transportation.description).to eq("Valid description.")
      end

      it "assigns the requested transportation as transportation" do
        put :update, id: transportation, transportation: valid_attributes
        expect(assigns(:transportation)).to eq(transportation)
      end

      it "redirects to list of all transportations" do
        put :update, id: transportation, transportation: valid_attributes
        expect(response).to redirect_to("/transportations")
      end
    end

    context "with invalid_attributes" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_transportation) }

      it "finds the requested transportation" do
        put :update, id: transportation, transportation: invalid_attributes
        expect(assigns(:transportation)).to eq(transportation)
      end

      it "does not change transportation's attributes" do
        put :update, id: transportation, transportation: invalid_attributes
        transportation.reload
        expect(transportation).to be_persisted
      end

      it "re-renders the #edit template" do
        put :update, id: transportation, transportation: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested transportation" do
      expect { delete :destroy, id: transportation }
              .to change(Transportation, :count).by(- 1)
    end

    it "redirects list of all transportations" do
      delete :destroy, id: transportation
      expect(response).to redirect_to "/transportations"
    end
  end
end
