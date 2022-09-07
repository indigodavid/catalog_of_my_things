require_relative 'item'

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
      json.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'genre' => @genre ? @genre.to_json : nil,
      'author' => @author ? @author.to_json : nil,
      'label' => @label ? @label.to_json : nil,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    obj = new(
      object['publish_date'],
      object['multiplayer'],
      object['last_played_at'],
      object['id'],
      archived: object['archived']
    )
    obj.add_author('author')
    obj.add_genre('genre')
    obj.add_label('label')

    obj
  end
end
