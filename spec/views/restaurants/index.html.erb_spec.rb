require 'spec_helper'

describe "restaurants/index", formats: :html do
  # include PathHelper

  before(:each) do
    assign(:restaurants, [
      stub_model(Restaurant,
        :name => "Name",
        :street => "Street",
        :city => "City"
      ),
      stub_model(Restaurant,
        :name => "Name",
        :street => "Street",
        :city => "City"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end

  it "should have the New Restaurant link" do
    should have_link "New Restaurant", :href => new_restaurant_path
  end

  it "displays restaurant" do
      a = Restaurant.create!(
        :name => "japan",
        :street => "Bach Dang",
        :city => "Da Nang")
      visit restaurants_path
      should have_content("japan")
    end

  it 'welcomes the user' do
    visit '/'
    page.should have_content('Caby')
  end
end
