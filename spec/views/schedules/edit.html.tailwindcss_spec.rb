require 'rails_helper'

RSpec.describe "schedules/edit", type: :view do
  let(:schedule) {
    Schedule.create!(
      week_days: "MyString",
      hour: "MyString",
      location: nil
    )
  }

  before(:each) do
    assign(:schedule, schedule)
  end

  it "renders the edit schedule form" do
    render

    assert_select "form[action=?][method=?]", schedule_path(schedule), "post" do

      assert_select "input[name=?]", "schedule[week_days]"

      assert_select "input[name=?]", "schedule[hour]"

      assert_select "input[name=?]", "schedule[location_id]"
    end
  end
end
