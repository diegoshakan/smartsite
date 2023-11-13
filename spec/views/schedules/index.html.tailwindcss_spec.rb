require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        week_days: "Week Days",
        hour: "Hour",
        location: nil
      ),
      Schedule.create!(
        week_days: "Week Days",
        hour: "Hour",
        location: nil
      )
    ])
  end

  it "renders a list of schedules" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Week Days".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Hour".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
