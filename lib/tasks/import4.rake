require 'csv'
require 'pry'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_game: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'

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


end
