require_relative './game'
require 'json'

module GameJson
  def load_games
    data = []
    file = "#{PATH_TO_JSON}games.json"

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |game|
        game = JSON.parse(game)
        obj = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], game['id'], game['archived'])
        obj.title = game['title']

        game_author = @authors.find { |author| obj.author.id == author.id }
        obj.add_author(game_author)

        game_genre = @genres.find { |genre| obj.genre.id == genre.id }
        obj.add_genre(game_genre)

        game_label = @labels.find { |label| obj.label.id == label.id }
        obj.add_label(game_label)

        data << game_instance
      end
    end
    data
  end
end
