require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = nil, archived: false)
    super(publish_date, id, archived)
    date = last_played_at.split('-')
    @multiplayer = multiplayer
    @last_played_at = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
  end

  def can_be_archived?
    super && ((DateTime.now - @last_played_at) / 365.25 > 2)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'publish_date' => @publish_date,
      'genre' => @genre || nil,
      'author' => @author || nil,
      'label' => @label || nil,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    obj = new(
      object['title'],
      object['publish_date'],
      object['multiplayer'],
      object['last_played_at'],
      object['id'],
      archived: object['archived']
    )
    obj.author = object['author']
    obj.genre = object['genre']
    obj.label = object['label']
    obj
  end
end
