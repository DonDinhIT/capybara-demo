require 'spec_helper'

describe "Restaurants" do
  describe "GET /restaurants" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get restaurants_path
      response.status.should be(200)
    end

    it "should have the New Restaurant link" do
    should have_link "New Restaurant", :href => new_restaurant_path
  end
  end
end
