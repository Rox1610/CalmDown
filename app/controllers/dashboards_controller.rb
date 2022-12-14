class DashboardsController < ApplicationController

  def calendar
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    # For a monthly view:
    @events = Event.where(user_id: current_user.id, start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def index
    timezone_offset = -18_000
    @ratings = current_user.events.order("start_time ASC").map do |event| { date: event.start_time, rating: event.diarie&.read_attribute_before_type_cast(:rating) } end
    @next_event = current_user.events.where('start_time >= ?', (Time.current + timezone_offset)).order("start_time ASC").first
  end

end
