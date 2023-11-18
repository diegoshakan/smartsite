require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    assign(:schedule, Schedule.create!(
      week_days: "Week Days",
      hour: "Hour",
      location: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Week Days/)
    expect(rendered).to match(/Hour/)
    expect(rendered).to match(//)
  end
end
