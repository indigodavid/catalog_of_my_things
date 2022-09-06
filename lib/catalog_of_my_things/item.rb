require 'date'
require 'json'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, id = nil, archived = nil)
    @publish_date = publish_date
    @id = id || Random.rand(1..1_000_000)
    @archived = archived || false
  end

  def can_be_archived?
    (Time.now - 10.years.ago) > @publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
  end

  def to_json(_options = nil)
    JSON.pretty_generate({
                           id: @id,
                           publish_date: @publish_date,
                           genre: @genre.attributes,
                           author: @author.attributes,
                           label: @label.attributes,
                           archived: @archived
                         })
  end

  private :can_be_archived?
end
