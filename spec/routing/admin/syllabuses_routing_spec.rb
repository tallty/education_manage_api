require "rails_helper"

RSpec.describe Admin::SyllabusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/syllabuses").to route_to("admin/syllabuses#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/syllabuses/new").to route_to("admin/syllabuses#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/syllabuses/1").to route_to("admin/syllabuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/syllabuses/1/edit").to route_to("admin/syllabuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/syllabuses").to route_to("admin/syllabuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/syllabuses/1").to route_to("admin/syllabuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/syllabuses/1").to route_to("admin/syllabuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/syllabuses/1").to route_to("admin/syllabuses#destroy", :id => "1")
    end

  end
end
