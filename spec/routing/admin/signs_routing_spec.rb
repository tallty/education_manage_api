require "rails_helper"

RSpec.describe Admin::SignsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/signs").to route_to("admin/signs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/signs/new").to route_to("admin/signs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/signs/1").to route_to("admin/signs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/signs/1/edit").to route_to("admin/signs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/signs").to route_to("admin/signs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/signs/1").to route_to("admin/signs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/signs/1").to route_to("admin/signs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/signs/1").to route_to("admin/signs#destroy", :id => "1")
    end

  end
end
