require 'csv'
require 'pry'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_event: :environment do
  require 'csv'
  file_path = 'db/data/2016'

  sports = []
  Sport.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      sports << row[7]
    end
    sports.uniq.compact.each do |s|
      sport = Sport.new(name: s)
      sport.save
    end
  end
  events = []

  Event.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      events << { name: row[8],
        sport: Sport.find_by_name(row[7])
      }
    end
    events.uniq.compact.each do |e|
      event = Event.new(name: e[:name], sport_id: e[:sport][:id])
      event.save
    end
  end

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

  olympians = []
  Olympian.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      olympians << {
        name: row[0],
        gender: row[1],
        age: row[2],
        height: row[3],
        weight: row[4],
        team: Team.find_by_name(row[5]),
        sport: Sport.find_by_name(row[7])
      }
    end
    olympians.uniq.compact.each do |s|
      olympian = Olympian.new(s)
      olympian.save
    end
  end

  games = []
  Game.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      games << row[6].gsub(/ /,'')
    end
    games.uniq.compact.each do |t|
      game = Game.new(name: t)
      game.save
    end
  end

  medals = []
  Medal.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      medals << row[9]
    end
    medals.uniq.compact.each do |t|
      medal = Medal.new(metal_type: t)
      medal.save
    end
  end

  medalists = []
  Medalist.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      medalists << {
        olympian: Olympian.find_by_name(row[0]),
        game_id: 1,
        medal: Medal.find_by_metal_type(row[9]),
        event: Event.find_by_name(row[8])
      }
    end
    medalists.uniq.compact.each do |s|
      medalist = Medalist.new(s)
      medalist.save
    end
  end
  Medalist.where(medal: 1).destroy_all
end
