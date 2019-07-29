require 'csv'
require 'pry'

Module CSVParser

  def events_reader(file_path)
    events = []
    CSV.foreach(file_path, headers: true) do |row|
      event_id = events_hash[row[:name]]
      events << { name: row[:Event] }
    end
    Event.import(events)
  end
