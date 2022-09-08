require_relative './genre'
require 'json'

module GenreJson
  def load_genres
    data = []
    file = "#{PATH_TO_JSON}genres.json"

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |genre|
        genre = JSON.parse(genre)
        data << Genre.new(
          genre['name'],
          genre['id']
        )
      end
    end
    data
  end
end
