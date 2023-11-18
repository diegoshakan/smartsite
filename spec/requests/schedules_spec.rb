require 'rails_helper'

RSpec.describe "/schedules", type: :request do
  let(:location) { FactoryBot.create(:location) }
  let(:valid_attributes) {
    FactoryBot.attributes_for(:schedule, location_id: location.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:schedule, hour: nil, location: location)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Schedule.create! valid_attributes
      get schedules_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      schedule = Schedule.create! valid_attributes
      get schedule_url(schedule)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_schedule_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      schedule = Schedule.create! valid_attributes
      get edit_schedule_url(schedule)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Schedule" do
        expect {
          post schedules_url, params: { schedule: valid_attributes }
        }.to change(Schedule, :count).by(1)
      end

      it "redirects to the created schedule" do
        post schedules_url, params: { schedule: valid_attributes }
        expect(response).to redirect_to(schedule_url(Schedule.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Schedule" do
        expect {
          post schedules_url, params: { schedule: invalid_attributes }
        }.to change(Schedule, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post schedules_url, params: { schedule: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { week_days: "Dom." }
      }

      it "updates the requested schedule" do
        schedule = Schedule.create! valid_attributes
        patch schedule_url(schedule), params: { schedule: new_attributes }
        schedule.reload
        expect(schedule.week_days).to eq(new_attributes[:week_days])
      end

      it "redirects to the schedule" do
        schedule = Schedule.create! valid_attributes
        patch schedule_url(schedule), params: { schedule: new_attributes }
        schedule.reload
        expect(response).to redirect_to(schedule_url(schedule))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        schedule = Schedule.create! valid_attributes
        patch schedule_url(schedule), params: { schedule: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested schedule" do
      schedule = Schedule.create! valid_attributes
      expect {
        delete schedule_url(schedule)
      }.to change(Schedule, :count).by(-1)
    end

    it "redirects to the schedules list" do
      schedule = Schedule.create! valid_attributes
      delete schedule_url(schedule)
      expect(response).to redirect_to(schedules_url)
    end
  end
end
