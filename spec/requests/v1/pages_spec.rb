require 'rails_helper'

RSpec.describe "V1::Pages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/v1/pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/v1/pages/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get "/v1/pages/contact"
      expect(response).to have_http_status(:success)
    end
  end

end
