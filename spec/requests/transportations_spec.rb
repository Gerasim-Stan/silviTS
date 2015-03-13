require 'rails_helper'

RSpec.describe "Transportations", :type => :request do
  describe "GET /transportations" do
    it "works! (now write some real specs)" do
      get transportations_path
      expect(response).to have_http_status(200)
    end
  end
end
