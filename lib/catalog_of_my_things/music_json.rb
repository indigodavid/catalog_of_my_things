require_relative './music_album'
require 'json'

module MusicAlbumJson
  def load_music_albums
    data = []
    file = "#{PATH_TO_JSON}music_albums.json"

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |music_album|
        music_album = JSON.parse(music_album)
        obj = MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'], music_album['id'],
                       archived: music_album['archived'])
        obj.title = music_album['title']

        obj.add_label(find_label(music_album['label']['id'])) if music_album['label']
        obj.add_author(find_author(music_album['author']['id'])) if music_album['author']
        obj.add_genre(find_genre(music_album['genre']['id'])) if music_album['genre']

        data << obj
      end
    end
    data
  end
end
