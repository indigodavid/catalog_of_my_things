require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..1_000_000)
    @archived = false
  end

  def can_be_archived?
    (Time.now - 10.years.ago) > @publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
