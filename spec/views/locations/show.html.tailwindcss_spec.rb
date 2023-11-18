require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    assign(:location, Location.create!(
      title: "Title",
      content: "MyText",
      opened: false,
      mask: "Mask",
      towel: "Towel",
      fountain: "Fountain",
      locker_room: "Locker Room"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Mask/)
    expect(rendered).to match(/Towel/)
    expect(rendered).to match(/Fountain/)
    expect(rendered).to match(/Locker Room/)
  end
end
