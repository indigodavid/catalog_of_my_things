require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = Random.rand(1..1_000_000), archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end
