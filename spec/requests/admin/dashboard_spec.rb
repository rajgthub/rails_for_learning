require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /main" do
    it "returns http success" do
      get "/admin/dashboard/main"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /user" do
    it "returns http success" do
      get "/admin/dashboard/user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /blog" do
    it "returns http success" do
      get "/admin/dashboard/blog"
      expect(response).to have_http_status(:success)
    end
  end

end
