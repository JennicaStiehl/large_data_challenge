require 'csv'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_team: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'

  teams = []
  Team.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      teams << row[5]
    end
    teams.uniq.compact.each do |t|
      team = Team.new(name: t)
      team.save
    end
  end
end
