require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      title: "MyString",
      content: "MyText",
      opened: false,
      mask: "MyString",
      towel: "MyString",
      fountain: "MyString",
      locker_room: "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

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
