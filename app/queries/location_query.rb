class LocationQuery
  def self.index
    Location.includes(:schedules).all
  end

  def self.search(opened)
    locations = Location.joins(:schedules)
    opened.include?('1') ? locations : locations.where(opened: true)
  end
end
