require 'rails_helper'

RSpec.describe "Admin::Syllabuses", type: :request do
  describe "GET /admin_syllabuses" do
    it "works! (now write some real specs)" do
      get admin_syllabuses_path
      expect(response).to have_http_status(200)
    end
  end
end
