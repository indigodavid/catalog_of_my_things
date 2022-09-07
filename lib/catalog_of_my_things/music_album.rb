require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = Random.rand(1..1_000_000), archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      json.create_id => self.class.name,
      'publish_date' => publish_date,
      'on_spotify' => on_spotify,
      'id' => id,
      'archived' => @archived,
      'genre' => genre
    }.to_json(*args)
  end

  def self.json_create(object)
    objc = new(object['publish_date'], object['on_spotify'], object['id'], archived: object['archived'])
    objc.add_genre('genre')
    objc
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end
