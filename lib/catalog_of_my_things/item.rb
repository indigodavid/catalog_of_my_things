require 'date'
require 'json'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, id = nil, archived = nil)
    date = publish_date.split('-')
    @publish_date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
    @id = id || Random.rand(1..1_000_000)
    @archived = archived || false
  end

  def can_be_archived?
    (DateTime.now - @publish_date) / 365.25 > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    return unless label

    label.add_item(self)
    @label = label
  end

  def add_author(author)
    return unless author

    author.add_item(self)
    @author = author
  end

  def add_genre(genre)
    return unless genre

    genre.add_item(self)
    @genre = genre
  end

  private :can_be_archived?
end
