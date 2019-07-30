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

  def medalists
    event = Event.find(params[:event_id])
    medalists = Hash.new(0)
    results = event.medalists.map do |medalist|
        medalists = {
          name: medalist.olympian.name,
          team: medalist.olympian.team.name,
          age: medalist.olympian.age,
          medal: medalist.medal.metal_type
        }
    end
    event = {event: event.name, medalists: results}
    render json: event
  end

end
