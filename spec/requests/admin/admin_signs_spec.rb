require 'rails_helper'

RSpec.describe "Admin::Signs", type: :request do
  describe "GET /admin_signs" do
    it "works! (now write some real specs)" do
      get admin_signs_path
      expect(response).to have_http_status(200)
    end
  end
end
