require_relative './item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, id = nil, archived: false)
    super(publish_date, id, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'archived' => @archived,
      'label' => @label || nil,
      'author' => @author || nil,
      'genre' => @genre || nil
    }.to_json(*args)
  end
end
