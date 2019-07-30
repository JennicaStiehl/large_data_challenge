class Api::V1::EventsController < ApplicationController

  def index
    sports = Hash.new(0)
    response = Sport.all.map do |sport|
      sports = {
        sport: sport.name,
        events: sport.events.map do |event|
            event.name
          end
      }
    end
    events = {events: response}
    render json: events

  end

end
