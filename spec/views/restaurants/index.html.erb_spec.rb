require 'spec_helper'

describe "restaurants/index" do
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

  it 'Check header page' do
    visit '/'
    page.should have_content('Listing restaurants')
  end

  it "support js", :js => true do
    visit restaurants_path
    click_link("test js")
    page.should have_content('js works')
  end
end
