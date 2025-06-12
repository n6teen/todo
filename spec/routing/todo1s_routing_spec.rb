require "rails_helper"

RSpec.describe Todo1sController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/todo1s").to route_to("todo1s#index")
    end

    it "routes to #new" do
      expect(get: "/todo1s/new").to route_to("todo1s#new")
    end

    it "routes to #show" do
      expect(get: "/todo1s/1").to route_to("todo1s#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/todo1s/1/edit").to route_to("todo1s#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/todo1s").to route_to("todo1s#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/todo1s/1").to route_to("todo1s#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/todo1s/1").to route_to("todo1s#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/todo1s/1").to route_to("todo1s#destroy", id: "1")
    end
  end
end
