require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  let(:location) {
    Location.create!(
      title: "MyString",
      content: "MyText",
      opened: false,
      mask: "MyString",
      towel: "MyString",
      fountain: "MyString",
      locker_room: "MyString"
    )
  }

  before(:each) do
    assign(:location, location)
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(location), "post" do

      assert_select "input[name=?]", "location[title]"

      assert_select "textarea[name=?]", "location[content]"

      assert_select "input[name=?]", "location[opened]"

      assert_select "input[name=?]", "location[mask]"

      assert_select "input[name=?]", "location[towel]"

      assert_select "input[name=?]", "location[fountain]"

      assert_select "input[name=?]", "location[locker_room]"
    end
  end
end
