require_relative './game'
require 'json'

module GameJson
  def load_games
    data = []
    file = "#{PATH_TO_JSON}games.json"

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |game|
        game = JSON.parse(game)
        obj = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], game['id'],
                       archived: game['archived'])
        obj.title = game['title']

        obj.add_label(find_label(game['label']['id'])) if game['label']
        obj.add_author(find_author(game['author']['id'])) if game['author']
        obj.add_genre(find_genre(game['genre']['id'])) if game['genre']

        data << obj
      end
    end
    data
  end
end
