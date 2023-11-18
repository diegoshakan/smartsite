require 'rails_helper'

RSpec.describe "schedules/new", type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
      week_days: "MyString",
      hour: "MyString",
      location: nil
    ))
  end

  it "renders new schedule form" do
    render

    assert_select "form[action=?][method=?]", schedules_path, "post" do

      assert_select "input[name=?]", "schedule[week_days]"

      assert_select "input[name=?]", "schedule[hour]"

      assert_select "input[name=?]", "schedule[location_id]"
    end
  end
end
