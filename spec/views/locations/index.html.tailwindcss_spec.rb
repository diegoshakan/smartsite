require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        title: "Title",
        content: "MyText",
        opened: false,
        mask: "Mask",
        towel: "Towel",
        fountain: "Fountain",
        locker_room: "Locker Room"
      ),
      Location.create!(
        title: "Title",
        content: "MyText",
        opened: false,
        mask: "Mask",
        towel: "Towel",
        fountain: "Fountain",
        locker_room: "Locker Room"
      )
    ])
  end

  it "renders a list of locations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mask".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Towel".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Fountain".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Locker Room".to_s), count: 2
  end
end
