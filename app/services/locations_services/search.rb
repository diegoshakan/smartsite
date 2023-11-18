module LocationsServices
  class Search
    def initialize(params)
      @hour = params[:hour]
      @opened = params[:opened]
    end

    def call
      select_from_params(@locations)
    end

    private

    def select_from_params(locations)
      @locations = LocationQuery.search(@opened)
      locations = []

      @locations.map do |location|
        location.schedules.each do |schedule|
          locations << location if verify_shift(schedule.hour)
        end
      end

      locations.uniq
    end

    def verify_shift(hour)
      return unless hour.include?('às')

      shift = shift_hour_search(@hour)
      shift_hour_academy(hour).cover?(shift) ||
        shift_hour_academy(hour).cover?(shift.first) ||
        shift_hour_academy(hour).cover?(shift.last)
    end

    def shift_hour_search(hour)
      (hour.split.first.to_time..hour.split.last.to_time)
    end

    def shift_hour_academy(schedule_hour)
      (schedule_hour.split.first.to_time..schedule_hour.split.last.to_time)
    end
  end
end
