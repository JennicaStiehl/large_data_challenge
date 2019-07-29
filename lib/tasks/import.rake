require 'csv'
require 'pry'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_event: :environment do
  require 'csv'
  file_path = 'lib/tasks/2016'
  events = []

  Event.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      events << row[8]
    end
    events.uniq.compact.each do |e|
      event = Event.new(name: e)
      event.save
    end
  end

  
end
