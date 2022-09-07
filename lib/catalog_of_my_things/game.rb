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
    super && ((DateTime.now - @last_played_at) > 2)
  end

  def to_json(_options = nil)
    JSON.pretty_generate({
                           id: @id,
                           publish_date: @publish_date,
                           genre: @genre ? @genre.attributes : nil,
                           author: @author ? @author.attributes : nil,
                           label: @label ? @label.attributes : nil,
                           archived: @archived,
                           multiplayer: @multiplayer,
                           last_played_at: @last_played_at
                         })
  end
end
