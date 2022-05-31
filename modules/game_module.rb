require_relative '../classes/game'
require 'json'

module GamesDataController
  def load_games
    file = 'games.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Game.new(element['multiplayer'], element['last_played_at'], element['published_date']))
      end
    end
    data
  end
end
