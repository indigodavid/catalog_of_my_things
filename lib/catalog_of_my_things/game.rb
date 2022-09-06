require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super.can_be_archived? && ((Time.now - 2.years.ago) > @last_played_at)
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
